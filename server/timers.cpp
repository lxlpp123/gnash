// 
//   Copyright (C) 2005, 2006 Free Software Foundation, Inc.
// 
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

// Linking Gnash statically or dynamically with other modules is making a
// combined work based on Gnash. Thus, the terms and conditions of the GNU
// General Public License cover the whole combination.
//
// As a special exception, the copyright holders of Gnash give you
// permission to combine Gnash with free software programs or libraries
// that are released under the GNU LGPL and with code included in any
// release of Talkback distributed by the Mozilla Foundation. You may
// copy and distribute such a system following the terms of the GNU GPL
// for all but the LGPL-covered parts and Talkback, and following the
// LGPL for the LGPL-covered parts.
//
// Note that people who make modified versions of Gnash are not obligated
// to grant this special exception for their modified versions; it is their
// choice whether to do so. The GNU General Public License gives permission
// to release a modified version without this exception; this exception
// also makes it possible to release a modified version which carries
// forward this exception.
// 
//
//

#include "log.h"
//#include "action.h"
#include "Function.h" // for class function_as_object
//#include "impl.h"
#include "log.h"
#include "smart_ptr.h"

#include "fn_call.h"

#include "timers.h"
#include "xml.h"

using namespace std;

namespace gnash {
  Timer::Timer() :
      _which(0),
      _interval(0.0),
      _start(0.0),
      _object(0),
      _env(0)
  {
  }
  
  Timer::Timer(as_value *obj, int ms)
  {
    setInterval(*obj, ms);
    start();
  }
  
  Timer::~Timer()
  {
    log_msg("%s: \n", __FUNCTION__);
  }
  
  int
  Timer::setInterval(as_value obj, int ms)
  {
    _function = obj;
    _interval = ms * 0.01;
    // _interval = ms * 0.000001;
    start();

    return 0;
  }

  int
  Timer::setInterval(as_value obj, int ms, as_environment *en)
  {
    _function = obj;
    _interval = ms * 0.01;
    _env = en;
    // _interval = ms * 0.000001;
    start();

    return 0;
  }
  int
  Timer::setInterval(as_value obj, int ms, std::vector<struct variable *> *locals)
  {
    _function = obj;
    _interval = ms * 0.01;
    _locals = locals;
    // _interval = ms * 0.000001;
    start();

    return 0;
  }

  int
  Timer::setInterval(as_value obj, int ms, as_object *this_ptr, as_environment *en)
  {
    _function = obj;
    _interval = ms * 0.01;
    _env = en;
    _object = this_ptr;
    // _interval = ms * 0.000001;
    start();

    return 0;
  }

  void
  Timer::clearInterval()
  {
    _interval = 0.0;
    _start = 0.0;
  }
  
  void
  Timer::start()
  {
    uint64 ticks = tu_timer::get_profile_ticks();
    _start = tu_timer::profile_ticks_to_seconds(ticks);
  }
  

  bool
  Timer::expired()
  {
    if (_start > 0.0) {
      uint64 ticks = tu_timer::get_profile_ticks();
      double now = tu_timer::profile_ticks_to_seconds(ticks);
      //printf("FIXME: %s: now is %f, start time is %f, interval is %f\n", __FUNCTION__, now, _start, _interval);
      if (now > _start + _interval) {
        _start = now;               // reset the timer
        //log_msg("Timer expired! \n");
        return true;
      }
      // FIXME: Sometimes, "now" and "_start" have bad values.
      // I don't know why, but this works around the problem..
      else if (now < _start) {
        log_msg( "Timer::expired - now (%lf) is before start (%lf)!\n"
                 "     Expiring right now.\n",
                 now, _start);
        _start = now;
        return true;
      }
    }
      
    // log_msg("Timer not enabled! \n");
    return false;
  }

  void
  timer_setinterval(const fn_call& fn)
  {
    int i;
    as_value	method;
    log_msg("%s: args=%d\n", __FUNCTION__, fn.nargs);
    
    timer_as_object *ptr = new timer_as_object;
    
    //  action_buffer	m_action_buffer;
    //timer_as_object*	ptr = (timer_as_object*) (as_object*) this_ptr;
    assert(ptr);
    
    movie*	mov = fn.env->get_target()->get_root_movie();
    function_as_object *as_func = (function_as_object *)fn.env->bottom(fn.first_arg_bottom_index).to_as_function();
    as_value val(as_func);
    int ms = (int)fn.env->bottom(fn.first_arg_bottom_index-1).to_number();

    tu_string local_name;
    as_value local_val;

    fn.env->add_frame_barrier();
    //method = env->get_variable("loopvar");

#if 1
    // FIXME: This is pretty gross, but something is broke elsewhere and it doesn't
    // seem to effect anything else. When a function is called from a executing
    // function, like calling setInterval() from within the callback to
    // XMLSocket::onConnect(), the local variables of the parent function need to
    // be propogated to the local stack as regular variables (not locals) or
    // they can't be found in the scope of the executing chld function. There is
    // probably a better way to do this... but at least this works.
    for (i=0; i< fn.env->get_local_frame_top(); i++) {
      if (fn.env->m_local_frames[i].m_name.size()) {
        //method = env->get_variable(env->m_local_frames[i].m_name);
        //if (method.get_type() != as_value::UNDEFINED)
        {
          local_name  = fn.env->m_local_frames[i].m_name;
          local_val = fn.env->m_local_frames[i].m_value;
          fn.env->set_variable(local_name, local_val);
        }
      }
    }
#endif
    //    ptr->obj.setInterval(val, ms, (as_object *)ptr, env);
    
    //Ptr->obj.setInterval(val, ms);
    ptr->obj.setInterval(val, ms, (as_object *)ptr, fn.env);
    
    fn.result->set_int(mov->add_interval_timer(&ptr->obj));
  }
  
  void
  timer_expire(const fn_call& fn)
  {
    //log_msg("%s:\n", __FUNCTION__);

    timer_as_object*	ptr = (timer_as_object*) (as_object*) fn.this_ptr;
    assert(ptr);
    const as_value&	val = ptr->obj.getASFunction();
    
    if (function_as_object* as_func = val.to_as_function()) {
      // It's an ActionScript function.  Call it.
      log_msg("Calling ActionScript function for setInterval Timer\n");
      (*as_func)(fn_call(fn.result, fn.this_ptr, fn.env, 0, 0));
    } else {
      log_error("FIXME: Couldn't find setInterval Timer!\n");
    }
  }
  
  void
  timer_clearinterval(const fn_call& fn)
  {
    //log_msg("%s: nargs = %d\n", __FUNCTION__, nargs);

    double id = fn.env->bottom(fn.first_arg_bottom_index).to_number();

    movie*	mov = fn.env->get_target()->get_root_movie();
    mov->clear_interval_timer((int)id);
    fn.result->set_bool(true); 
  }
}
