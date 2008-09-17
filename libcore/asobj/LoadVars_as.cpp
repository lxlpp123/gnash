// LoadVars.cpp:  ActionScript "LoadVars" class (HTTP variables), for Gnash.
// 
//   Copyright (C) 2005, 2006, 2007, 2008 Free Software Foundation, Inc.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//

#include "LoadVars_as.h"
#include "as_object.h" // for inheritance
#include "log.h"
#include "fn_call.h"
#include "smart_ptr.h" // GNASH_USE_GC
#include "builtin_function.h" // need builtin_function
#include "as_function.h" // for calling event handlers
#include "as_value.h" // for setting up a fn_call
#include "StreamProvider.h"
#include "URL.h"
#include "gnash.h" // for get_base_url
#include "IOChannel.h"
#include "timers.h"
#include "VM.h"
#include "Object.h" // for getObjectInterface
#include "LoadThread.h"
#include "namedStrings.h"
#include "utf8.h"
#include "NetworkAdapter.h"
#include "array.h"

#include <list>
#include <boost/algorithm/string/case_conv.hpp>
#include <boost/noncopyable.hpp>
#include <functional>

//#define DEBUG_LOADS 1

namespace gnash {

static as_value loadvars_addRequestHeader(const fn_call& fn);
static as_value loadvars_load(const fn_call& fn);
static as_value loadvars_send(const fn_call& fn);
static as_value loadvars_sendAndLoad(const fn_call& fn);
static as_value loadvars_tostring(const fn_call& fn);
static as_value loadvars_ctor(const fn_call& fn);

//--------------------------------------------

/// LoadVars ActionScript class
//
class LoadVars_as: public as_object, boost::noncopyable
{

public:

	/// @param env
	/// 	Environment to use for event handlers calls
	///
	LoadVars_as();

	~LoadVars_as();

	/// Load data from given URL
	//
	/// Actually adds a arequest for the load.
	/// The loader thread will only be started
	/// later.
	///
	void load(const std::string& url);

	/// \brief
	/// Load data from given URL into the given target, sending
	/// enumerable properties of this object using either POST or
	/// GET method.
	//
	/// Actually adds a request for the load.
	/// The loader thread will only be started later.
	///
	/// @param urlstr
	///	The base url string to post to (and load from).
	///
	/// @param target
	///	The LoadVars that will process a completed load, thus
	///	getting the members from the response attached.
	///
	/// @param post
	///	If false, variables will be sent using the GET method.
	///	If true (the default), variables will be sent using POST.
	///
	void sendAndLoad(const std::string& urlstr, as_object& target, bool post=true);

    void queueLoad(std::auto_ptr<IOChannel> str);

	static as_object* getLoadVarsInterface();

	static void attachLoadVarsInterface(as_object& o);

	// override from as_object ?
	//std::string get_text_value() const { return "LoadVars"; }

	// override from as_object ?
	//double get_numeric_value() const { return 0; }
	
	size_t getBytesLoaded() const {
		return _bytesLoaded;
	}

	size_t getBytesTotal() const {
		return _bytesTotal;
	}

protected:

#ifdef GNASH_USE_GC
	/// Mark all reachable resources, for the GC
	//
	/// There are no special reachable resources here
	///
	virtual void markReachableResources() const
	{

		// Invoke generic as_object marker
		markAsObjectReachable();
	}

#endif // GNASH_USE_GC

private:

	/// Return enumerable property pairs in url-encoded form
	//
	/// TODO: move up to as_object and make public,
	///       for use by loadVariables ?
	///
	std::string getURLEncodedProperties();

	/// Check for completed loading threads, fire
	/// new threads if needed.
	void checkLoads();

	static as_value checkLoads_wrapper(const fn_call& fn);

	static as_value onLoad_getset(const fn_call& fn);

	static as_value getBytesLoaded_method(const fn_call& fn);

	static as_value getBytesTotal_method(const fn_call& fn);

	static as_value decode_method(const fn_call& fn);

	static as_value onData_method(const fn_call& fn);

	static as_value onLoad_method(const fn_call& fn);

	boost::intrusive_ptr<as_function> _onLoad;

	size_t _bytesTotal;

	size_t _bytesLoaded;

	/// List of load requests
	typedef std::list<LoadThread*> LoadThreadList;

	/// Load requests queue
	//
	/// TODO: 
	/// Is serialization of loads needed to properly 
	/// implement getBytesLoaded() and getBytesTotal()
	/// methods ?
	/// (ie: values from *which* load should be reported?)
	///
	LoadThreadList _loadThreads; 

	unsigned int _loadCheckerTimer;

};

LoadVars_as::LoadVars_as()
		:
		as_object(getLoadVarsInterface()),
		_bytesTotal(0),
		_bytesLoaded(0),
		_loadThreads(),
		_loadCheckerTimer(0)
{
}

LoadVars_as::~LoadVars_as()
{
	for (LoadThreadList::iterator it=_loadThreads.begin(); it != _loadThreads.end(); ++it)
	{
		delete *it; // supposedly joins the thread
	}

	if ( _loadCheckerTimer )
	{
		VM& vm = getVM();
        	vm.getRoot().clear_interval_timer(_loadCheckerTimer);
	}
}

void
LoadVars_as::checkLoads()
{
#ifdef DEBUG_LOADS
    static int call=0;
    log_debug("LoadVars %p checkLoads call %d, _loadThreads: %d", (void *)this, ++call, _loadThreads.size());
#endif

    if ( _loadThreads.empty() ) return; // nothing to do

    for (LoadThreadList::iterator it=_loadThreads.begin();
            it != _loadThreads.end(); )
    {
        LoadThread* lt = *it;

#ifdef DEBUG_LOADS
        log_debug("LoadVars loads thread %p got %ld/%ld bytes", (void*)lt, lt->getBytesLoaded(), lt->getBytesTotal() );
#endif
        if ( lt->completed() )
        {
            size_t xmlsize = _bytesTotal = _bytesLoaded = lt->getBytesTotal();
            boost::scoped_array<char> buf(new char[xmlsize+1]);
            size_t actuallyRead = lt->read(buf.get(), xmlsize);
            if ( actuallyRead != xmlsize )
			{
				// This would be either a bug of LoadThread or an expected
				// possibility which lacks documentation (thus a bug in documentation)
				//
#ifdef DEBUG_LOADS
				log_debug("LoadThread::getBytesTotal() returned %d but ::read(%d) returned %d",
					xmlsize, xmlsize, actuallyRead);
#endif
			}
            buf[actuallyRead] = '\0';

            // Strip BOM, if any.
            // See http://savannah.gnu.org/bugs/?19915
            utf8::TextEncoding encoding;
            // NOTE: the call below will possibly change 'xmlsize' parameter
            char* bufptr = utf8::stripBOM(buf.get(), xmlsize, encoding);
            if ( encoding != utf8::encUTF8 && encoding != utf8::encUNSPECIFIED )
            {
                log_unimpl("%s to utf8 conversion in LoadVars input parsing", utf8::textEncodingName(encoding));
            }
            as_value dataVal(bufptr); // memory copy here (optimize?)

            it = _loadThreads.erase(it);
            delete lt; // supposedly joins the thread...

            // might push_front on the list..
            callMethod(NSV::PROP_ON_DATA, dataVal);

#ifdef DEBUG_LOADS
            log_debug("Completed load, _loadThreads have now %d elements", _loadThreads.size());
#endif
        }
        else
        {
            _bytesLoaded = lt->getBytesLoaded();
            ++it;
        }
    }

    if ( _loadThreads.empty() ) 
    {
#ifdef DEBUG_LOADS
        log_debug("Clearing LoadVars load checker interval timer");
#endif
	VM& vm = getVM();
        vm.getRoot().clear_interval_timer(_loadCheckerTimer);
        _loadCheckerTimer=0;
    }
}

void
LoadVars_as::attachLoadVarsInterface(as_object& o)
{
	o.init_member("addRequestHeader", new builtin_function(loadvars_addRequestHeader));
	o.init_member("decode", new builtin_function(LoadVars_as::decode_method));
	o.init_member("getBytesLoaded", new builtin_function(LoadVars_as::getBytesLoaded_method));
	o.init_member("getBytesTotal", new builtin_function(LoadVars_as::getBytesTotal_method));
	o.init_member("load", new builtin_function(loadvars_load));
	o.init_member("send", new builtin_function(loadvars_send));
	o.init_member("sendAndLoad", new builtin_function(loadvars_sendAndLoad));
	o.init_member("toString", new builtin_function(loadvars_tostring));
	o.init_member("onData", new builtin_function(LoadVars_as::onData_method));
	o.init_member("onLoad", new builtin_function(LoadVars_as::onLoad_method));
}

as_object*
LoadVars_as::getLoadVarsInterface()
{
	static boost::intrusive_ptr<as_object> o;
	if ( ! o )
	{
		o = new as_object(getObjectInterface());
		attachLoadVarsInterface(*o);
	}
	return o.get();
}


void
LoadVars_as::queueLoad(std::auto_ptr<IOChannel> str)
{

	bool startTimer = _loadThreads.empty();

	std::auto_ptr<LoadThread> lt (new LoadThread(str));

	// we push on the front to avoid invalidating
	// iterators when queueLoad is called as effect
	// of onData invocation.
	// Doing so also avoids processing queued load
	// request immediately
	// 
	_loadThreads.push_front(lt.release());
#ifdef DEBUG_LOADS
	log_debug("Pushed thread %p to _loadThreads, number of "
            "LoadVars load threads now: %d",
            static_cast<void*>(_loadThreads.front()),  _loadThreads.size());
#endif

	if (startTimer)
	{
		boost::intrusive_ptr<builtin_function> loadsChecker = 
			new builtin_function(&LoadVars_as::checkLoads_wrapper);
		std::auto_ptr<Timer> timer(new Timer);
		timer->setInterval(*loadsChecker, 50, this);
		_loadCheckerTimer = getVM().getRoot().add_interval_timer(timer, true);
#ifdef DEBUG_LOADS
		log_debug("Registered LoadVars loads interval %d", _loadCheckerTimer);
#endif
    }
}


void
LoadVars_as::load(const std::string& urlstr)
{
    // Set loaded property to false; will be updated (hopefully)
    // when loading is complete.
	set_member(NSV::PROP_LOADED, false);

	URL url(urlstr, get_base_url());

    // Checks whether access is allowed.
    std::auto_ptr<IOChannel> str(StreamProvider::getDefaultInstance().getStream(url));

	if (!str.get()) 
	{
		log_error(_("LoadVars.load(): Can't load variables from %s (security?)"), url.str());
		return;
		// TODO: check if this is correct
		//as_value nullValue; nullValue.set_null();
		//callMethod(VM::get().getStringTable().find(PROPNAME("onData")), nullValue);
	}

	log_security(_("Loading variables file from url: '%s'"), url.str());
    queueLoad(str);

}

std::string
LoadVars_as::getURLEncodedProperties()
{
	// TODO: optimize this function... 

	using std::string;

	string qstring;

	typedef std::map<std::string, std::string> VarMap;
	VarMap vars;

	//return qstring;

	// TODO: it seems that calling enumerateProperties(vars) here
	//       somehow corrupts the stack !
	enumerateProperties(vars);

	for (VarMap::iterator it=vars.begin(), itEnd=vars.end();
			it != itEnd; ++it)
	{
		string var = it->first; URL::encode(var);
		string val = it->second; URL::encode(val);
		if ( it != vars.begin() ) qstring += string("&");
		qstring += var + string("=") + val;
	}

	return qstring;
}

void
LoadVars_as::sendAndLoad(const std::string& urlstr, as_object& target, bool post)
{

    /// All objects get a loaded member, set to false.
    target.set_member(NSV::PROP_LOADED, false);

	std::string querystring = getURLEncodedProperties();

	URL url(urlstr, get_base_url());

	std::auto_ptr<IOChannel> str;
	if (post)
    {
        string_table& st = _vm.getStringTable();
        as_value customHeaders;

        NetworkAdapter::RequestHeaders headers;

        if (get_member(NSV::PROP_uCUSTOM_HEADERS, &customHeaders))
        {

            /// Read in our custom headers if they exist and are an
            /// array.
            Array_as* array = dynamic_cast<Array_as*>(
                            customHeaders.to_object().get());
                            
            if (array)
            {
                Array_as::const_iterator e = array->end();
                --e;

                for (Array_as::const_iterator i = array->begin(); i != e; ++i)
                {
                    // Only even indices can be a header.
                    if (i.index() % 2) continue;
                    if (! (*i).is_string()) continue;
                    
                    // Only the immediately following odd number can be 
                    // a value.
                    if (array->at(i.index() + 1).is_string())
                    {
                        const std::string& name = (*i).to_string();
                        const std::string& val =
                                    array->at(i.index() + 1).to_string();
                                    
                        // Values should overwrite existing ones.
                        headers[name] = val;
                    }
                    
                }
            }
        }

        as_value contentType;

        if ( get_member(st.find("contentType"), &contentType) )
        {
            // This should not overwrite anything set in LoadVars.addRequestHeader();
            headers.insert(std::make_pair("Content-Type", contentType.to_string()));
        }

        /// It doesn't matter if there are no request headers.
        str = StreamProvider::getDefaultInstance().getStream(url,
                                                    querystring, headers);
    }
	else
    {
    	std::string url = urlstr + "?" + querystring;
        str = StreamProvider::getDefaultInstance().getStream(url);
    }

	if (!str.get()) 
	{
		log_error(_("Can't load variables from %s (security?)"), url.str());
		return;
		// TODO: check if this is correct
		//as_value nullValue; nullValue.set_null();
		//callMethod(VM::get().getStringTable().find(PROPNAME("onData")), nullValue);
	}

	log_security(_("Loading variables file from url: '%s'"), url.str());
    target.queueLoad(str);
	
}

/* private static */
as_value
LoadVars_as::checkLoads_wrapper(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);
	ptr->checkLoads();
	return as_value();
}

as_value
loadvars_addRequestHeader(const fn_call& fn)
{
    
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);   

    as_value customHeaders;
    as_object* array;

    if (ptr->get_member(NSV::PROP_uCUSTOM_HEADERS, &customHeaders))
    {
        array = customHeaders.to_object().get();
        if (!array)
        {
            IF_VERBOSE_ASCODING_ERRORS(
                log_aserror(_("LoadVars.addRequestHeader: "
                         "LoadVars._customHeaders is not an object"));
            );
            return as_value();
        }
    }
    else
    {
        array = new Array_as;
        // This property is always initialized on the first call to
        // addRequestHeaders.
        ptr->set_member(NSV::PROP_uCUSTOM_HEADERS, array);
    }

    if (fn.nargs == 0)
    {
        // Return after having initialized the _customHeaders array.
        IF_VERBOSE_ASCODING_ERRORS(
            log_aserror(_("LoadVars.addRequestHeader requires at least "
                          "one argument"));
        );
        return as_value();
    }
    
    if (fn.nargs == 1)
    {
        // This must be an array. Keys / values are pushed in valid
        // pairs to the _customHeaders array.    
        boost::intrusive_ptr<as_object> obj = fn.arg(0).to_object();
        Array_as* headerArray = dynamic_cast<Array_as*>(obj.get());

        if (!headerArray)
        {
            IF_VERBOSE_ASCODING_ERRORS(
                log_aserror(_("LoadVars.addRequestHeader: single argument "
                                "is not an array"));
            );
            return as_value();
        }

        Array_as::const_iterator e = headerArray->end();
        --e;

        for (Array_as::const_iterator i = headerArray->begin(); i != e; ++i)
        {
            // Only even indices can be a key, and they must be a string.
            if (i.index() % 2) continue;
            if (!(*i).is_string()) continue;
            
            // Only the immediately following odd number can be 
            // a value, and it must also be a string.
            const as_value& val = headerArray->at(i.index() + 1);
            if (val.is_string())
            {
                array->callMethod(NSV::PROP_PUSH, *i, val);
            }
        }
        return as_value();
    }
        
    if (fn.nargs > 2)
    {
        IF_VERBOSE_ASCODING_ERRORS(
            std::ostringstream ss;
            fn.dump_args(ss);
            log_aserror(_("LoadVars.addRequestHeader(%s): arguments after the"
                            "second will be discarded"), ss.str());
        );
    }
    
    // Push both to the _customHeaders array.
    const as_value& name = fn.arg(0);
    const as_value& val = fn.arg(1);
    
    // Both arguments must be strings.
    if (!name.is_string() || !val.is_string())
    {
        IF_VERBOSE_ASCODING_ERRORS(
            std::ostringstream ss;
            fn.dump_args(ss);
            log_aserror(_("LoadVars.addRequestHeader(%s): both arguments "
                        "must be a string"), ss.str());
        );
        return as_value(); 
    }

    array->callMethod(NSV::PROP_PUSH, name, val);
    
    return as_value();
}


as_value
LoadVars_as::decode_method(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);

	if ( ! fn.nargs ) return as_value(false);

	typedef std::map<std::string, std::string> ValuesMap;

	ValuesMap vals;

	URL::parse_querystring(fn.arg(0).to_string(), vals);

	string_table& st = ptr->getVM().getStringTable();
	for  (ValuesMap::const_iterator it=vals.begin(), itEnd=vals.end();
			it != itEnd; ++it)
	{
		ptr->set_member(st.find(it->first), as_value(it->second.c_str()));
	}

	return as_value(); 
}

as_value
LoadVars_as::getBytesLoaded_method(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);
	return as_value(ptr->getBytesLoaded());
}

as_value
LoadVars_as::getBytesTotal_method(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);
	return as_value(ptr->getBytesTotal());
}

as_value
LoadVars_as::onData_method(const fn_call& fn)
{
	//GNASH_REPORT_FUNCTION;

	as_object* thisPtr = fn.this_ptr.get();
	if ( ! thisPtr ) return as_value();

	// See http://gitweb.freedesktop.org/?p=swfdec/swfdec.git;a=blob;f=libswfdec/swfdec_initialize.as

	as_value src; src.set_null();
	if ( fn.nargs ) src = fn.arg(0);

	if ( ! src.is_null() )
	{
		VM& vm = thisPtr->getVM();
		string_table& st = vm.getStringTable();
		string_table::key decodeKey = st.find("decode"); // add to namedStrings ?

		as_value tmp(true);
		thisPtr->set_member(NSV::PROP_LOADED, tmp);
		thisPtr->callMethod(decodeKey, src);
		thisPtr->callMethod(NSV::PROP_ON_LOAD, tmp);
	}
	else
	{
		as_value tmp(true);
		thisPtr->set_member(NSV::PROP_LOADED, tmp);
		thisPtr->callMethod(NSV::PROP_ON_LOAD, tmp);
	}

	return as_value();
}

as_value
LoadVars_as::onLoad_method(const fn_call& /*fn*/)
{
	//GNASH_REPORT_FUNCTION;
	return as_value();
}

static as_value
loadvars_load(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> obj = ensureType<LoadVars_as>(fn.this_ptr);

	if ( fn.nargs < 1 )
	{
		IF_VERBOSE_ASCODING_ERRORS(
		log_aserror(_("LoadVars.load() requires at least one argument"));
		);
		return as_value(false);
	}

	const std::string& urlstr = fn.arg(0).to_string();
	if ( urlstr.empty() )
	{
		IF_VERBOSE_ASCODING_ERRORS(
		log_aserror(_("LoadVars.load(): invalid empty url"));
		);
		return as_value(false);
	}

	obj->load(urlstr);
	return as_value(true);
	
}

static as_value
loadvars_send(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);
	UNUSED(ptr);
	log_unimpl (__FUNCTION__);
	return as_value(); 
}

static as_value
loadvars_sendAndLoad(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);

	if ( fn.nargs < 2 )
	{
		IF_VERBOSE_ASCODING_ERRORS(
		log_aserror(_("LoadVars.sendAndLoad() requires at least two arguments"));
		);
		return as_value(false);
	}

	const std::string& urlstr = fn.arg(0).to_string();
	if ( urlstr.empty() )
	{
		IF_VERBOSE_ASCODING_ERRORS(
		log_aserror(_("LoadVars.sendAndLoad(): invalid empty url"));
		);
		return as_value(false);
	}

	if (!fn.arg(1).is_object())
	{
		IF_VERBOSE_ASCODING_ERRORS(
		    log_aserror(_("LoadVars.sendAndLoad(): invalid target (must be an object)"));
		);
		return as_value(false);
	}


	boost::intrusive_ptr<as_object> target = fn.arg(1).to_object();

	// Post by default, override by ActionScript third argument
	bool post = true;
	if ( fn.nargs > 2 && fn.arg(2).to_string() == "GET" ) post = false;

	//log_debug("LoadVars.sendAndLoad(%s, %p) called, and returning TRUE", urlstr.c_str(), target.get());

	ptr->sendAndLoad(urlstr, *target, post);
	return as_value(true);
}

static as_value
loadvars_tostring(const fn_call& fn)
{
	boost::intrusive_ptr<LoadVars_as> ptr = ensureType<LoadVars_as>(fn.this_ptr);
	UNUSED(ptr);
	log_unimpl (__FUNCTION__);
	return as_value(); 
}

static as_value
loadvars_ctor(const fn_call& fn)
{
	boost::intrusive_ptr<as_object> obj = new LoadVars_as;

	if ( fn.nargs )
	{
		std::stringstream ss;
		fn.dump_args(ss);
		log_unimpl("new LoadVars(%s) - arguments discarded", ss.str().c_str()); // or ASERROR ?
	}
	
	return as_value(obj.get()); // will keep alive
}

// extern (used by Global.cpp)
void
loadvars_class_init(as_object& global)
{
	// This is going to be the global LoadVars "class"/"function"
	static boost::intrusive_ptr<builtin_function> cl;

	if ( cl == NULL )
	{
		cl=new builtin_function(&loadvars_ctor, LoadVars_as::getLoadVarsInterface());
		// replicate all interface to class, to be able to access
		// all methods as static functions
		LoadVars_as::attachLoadVarsInterface(*cl);
		     
	}

	// Register _global.LoadVars
	global.init_member("LoadVars", cl.get());

}


} // end of gnash namespace