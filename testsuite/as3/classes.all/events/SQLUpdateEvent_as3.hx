// SQLUpdateEvent_as3.hx:  ActionScript 3 "SQLUpdateEvent" class, for Gnash.
//
// Generated by gen-as3.sh on: 20090515 by "rob". Remove this
// after any hand editing loosing changes.
//
//   Copyright (C) 2009 Free Software Foundation, Inc.
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

// This test case must be processed by CPP before compiling to include the
//  DejaGnu.hx header file for the testing framework support.

#if flash9
import flash.events.SQLUpdateEvent;
import flash.display.MovieClip;
#else
import flash.SQLUpdateEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class SQLUpdateEvent_as3 {
    static function main() {
        var x1:SQLUpdateEvent = new SQLUpdateEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("SQLUpdateEvent class exists");
        } else {
            DejaGnu.fail("SQLUpdateEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.rowID == 0) {
	    DejaGnu.pass("SQLUpdateEvent.rowID property exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent.rowID property doesn't exist");
	}
	if (x1.table == null) {
	    DejaGnu.pass("SQLUpdateEvent.table property exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent.table property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.SQLUpdateEvent == 0) {
	    DejaGnu.pass("SQLUpdateEvent::SQLUpdateEvent() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::SQLUpdateEvent() method doesn't exist");
	}
	if (x1.clone == Event) {
	    DejaGnu.pass("SQLUpdateEvent::clone() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::clone() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("SQLUpdateEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("SQLUpdateEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("SQLUpdateEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("SQLUpdateEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("SQLUpdateEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("SQLUpdateEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("SQLUpdateEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("SQLUpdateEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("SQLUpdateEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::CONNECT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("SQLUpdateEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DELETE == null) {
	    DejaGnu.pass("SQLUpdateEvent::DELETE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::DELETE() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("SQLUpdateEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("SQLUpdateEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("SQLUpdateEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("SQLUpdateEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("SQLUpdateEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("SQLUpdateEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("SQLUpdateEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("SQLUpdateEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("SQLUpdateEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::INIT() method doesn't exist");
	}
	if (x1.INSERT == null) {
	    DejaGnu.pass("SQLUpdateEvent::INSERT() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::INSERT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("SQLUpdateEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::LOCATION() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("SQLUpdateEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::MOUSE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("SQLUpdateEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("SQLUpdateEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::OPEN() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("SQLUpdateEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("SQLUpdateEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("SQLUpdateEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("SQLUpdateEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::RESIZE() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("SQLUpdateEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("SQLUpdateEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::SELECT() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("SQLUpdateEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("SQLUpdateEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("SQLUpdateEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("SQLUpdateEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("SQLUpdateEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::UNLOAD() method doesn't exist");
	}
	if (x1.UPDATE == null) {
	    DejaGnu.pass("SQLUpdateEvent::UPDATE() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::UPDATE() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("SQLUpdateEvent::USER() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("SQLUpdateEvent::USER() method exists");
	} else {
	    DejaGnu.fail("SQLUpdateEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

