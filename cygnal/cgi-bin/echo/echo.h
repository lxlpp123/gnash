// Red5 server side support for the echo_test via RTMP
// 
//   Copyright (C) 2008, 2009, 2010 Free Software Foundation, Inc.
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

#ifndef _ECHO_H_
#define _ECHO_H_

#include <vector>
#include <boost/shared_ptr.hpp>
#include <boost/shared_array.hpp>
#include <boost/scoped_array.hpp>
#include <sstream>

// gnash headers
#include "amf.h"
#include "buffer.h"
#include "element.h"
#include "http.h"
#include "cygnal.h"

// cygnal headers
#include "rtmp_server.h"
#include "handler.h"

namespace cygnal
{
    
class EchoTest : public cygnal::RTMPServer
{
public:
    EchoTest ();
    ~EchoTest ();
  
    // Parse an Echo Request message coming from the Red5 echo_test.
    std::vector<boost::shared_ptr<cygnal::Element > > parseEchoRequest(cygnal::Buffer &buf)
        { return parseEchoRequest(buf.reference(), buf.size()); };
    std::vector<boost::shared_ptr<cygnal::Element > > parseEchoRequest(boost::uint8_t *buf, size_t size);
    
    // format a response to the 'echo' test used for testing Gnash.
    boost::shared_ptr<cygnal::Buffer> formatEchoResponse(double num, cygnal::Element &el);
    boost::shared_ptr<cygnal::Buffer> formatEchoResponse(double num, cygnal::Buffer &data);
    boost::shared_ptr<cygnal::Buffer> formatEchoResponse(double num, boost::uint8_t *data, size_t size);

    boost::shared_ptr<cygnal::Buffer> getResponse() { return _response; };
    void setResponse(boost::shared_ptr<cygnal::Buffer> &x) { _response = x; };

    void setNetConnection(gnash::RTMPMsg *msg) { _netconnect.reset(msg); };
    void setNetConnection(boost::shared_ptr<gnash::RTMPMsg> msg) { _netconnect = msg; };
    boost::shared_ptr<gnash::RTMPMsg> getNetConnection() { return _netconnect;};
    
private:
    boost::shared_ptr<cygnal::Buffer> _response;    
    boost::shared_ptr<Handler::cygnal_init_t> _info;
    /// \var _netconnect
    ///    This store the data from the NetConnection ActionScript
    ///    object we get as the final part of the handshake process
    ///    that is used to set up the connection. This has all the
    ///    file paths and other information needed by the server.
    boost::shared_ptr<gnash::RTMPMsg>	_netconnect;    
};  

// the standard API
extern "C" {
    boost::shared_ptr<Handler::cygnal_init_t>echo_init_func(boost::shared_ptr<gnash::RTMPMsg> &msg);
    
    boost::shared_ptr<cygnal::Buffer> echo_read_func();
    size_t echo_write_func(boost::uint8_t *data, size_t size);
}

} // end of cygnal namespace
#endif  // end of __ECHO_H__

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:
