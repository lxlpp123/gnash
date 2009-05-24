// NativeDragEvent_as3.hx:  ActionScript 3 "NativeDragEvent" class, for Gnash.
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
import flash.events.NativeDragEvent;
import flash.display.MovieClip;
#else
import flash.NativeDragEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class NativeDragEvent_as3 {
    static function main() {
        var x1:NativeDragEvent = new NativeDragEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("NativeDragEvent class exists");
        } else {
            DejaGnu.fail("NativeDragEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.allowedActions == allowedActions) {
	    DejaGnu.pass("NativeDragEvent.allowedActions property exists");
	} else {
	    DejaGnu.fail("NativeDragEvent.allowedActions property doesn't exist");
	}
	if (x1.clipboard == Clipboard) {
	    DejaGnu.pass("NativeDragEvent.clipboard property exists");
	} else {
	    DejaGnu.fail("NativeDragEvent.clipboard property doesn't exist");
	}
	if (x1.dropAction == null) {
	    DejaGnu.pass("NativeDragEvent.dropAction property exists");
	} else {
	    DejaGnu.fail("NativeDragEvent.dropAction property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.NativeDragEvent == false) {
	    DejaGnu.pass("NativeDragEvent::NativeDragEvent() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NativeDragEvent() method doesn't exist");
	}
	if (x1.clone == Event) {
	    DejaGnu.pass("NativeDragEvent::clone() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::clone() method doesn't exist");
	}
	if (x1.toString == null) {
	    DejaGnu.pass("NativeDragEvent::toString() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::toString() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("NativeDragEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("NativeDragEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("NativeDragEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("NativeDragEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("NativeDragEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLICK == null) {
	    DejaGnu.pass("NativeDragEvent::CLICK() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CLICK() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("NativeDragEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("NativeDragEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("NativeDragEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("NativeDragEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CONNECT() method doesn't exist");
	}
	if (x1.CONTEXT == MENU) {
	    DejaGnu.pass("NativeDragEvent::CONTEXT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::CONTEXT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("NativeDragEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("NativeDragEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.DOUBLE == CLICK) {
	    DejaGnu.pass("NativeDragEvent::DOUBLE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::DOUBLE() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("NativeDragEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("NativeDragEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("NativeDragEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("NativeDragEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("NativeDragEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("NativeDragEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("NativeDragEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("NativeDragEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::INIT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("NativeDragEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::LOCATION() method doesn't exist");
	}
	if (x1.MIDDLE == CLICK) {
	    DejaGnu.pass("NativeDragEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MIDDLE == MOUSE) {
	    DejaGnu.pass("NativeDragEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MIDDLE == MOUSE) {
	    DejaGnu.pass("NativeDragEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MOUSE == DOWN) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == MOVE) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == OUT) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == OVER) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == UP) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == WHEEL) {
	    DejaGnu.pass("NativeDragEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::MOUSE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NATIVE == DRAG) {
	    DejaGnu.pass("NativeDragEvent::NATIVE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NATIVE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("NativeDragEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("NativeDragEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::OPEN() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("NativeDragEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("NativeDragEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("NativeDragEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("NativeDragEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::RESIZE() method doesn't exist");
	}
	if (x1.RIGHT == CLICK) {
	    DejaGnu.pass("NativeDragEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::RIGHT() method doesn't exist");
	}
	if (x1.RIGHT == MOUSE) {
	    DejaGnu.pass("NativeDragEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::RIGHT() method doesn't exist");
	}
	if (x1.RIGHT == MOUSE) {
	    DejaGnu.pass("NativeDragEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::RIGHT() method doesn't exist");
	}
	if (x1.ROLL == OUT) {
	    DejaGnu.pass("NativeDragEvent::ROLL() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ROLL() method doesn't exist");
	}
	if (x1.ROLL == OVER) {
	    DejaGnu.pass("NativeDragEvent::ROLL() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::ROLL() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("NativeDragEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("NativeDragEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::SELECT() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("NativeDragEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("NativeDragEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("NativeDragEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("NativeDragEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("NativeDragEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::UNLOAD() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("NativeDragEvent::USER() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("NativeDragEvent::USER() method exists");
	} else {
	    DejaGnu.fail("NativeDragEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

