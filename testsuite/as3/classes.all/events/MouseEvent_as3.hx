// MouseEvent_as3.hx:  ActionScript 3 "MouseEvent" class, for Gnash.
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
import flash.events.MouseEvent;
import flash.display.MovieClip;
#else
import flash.MouseEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class MouseEvent_as3 {
    static function main() {
        var x1:MouseEvent = new MouseEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("MouseEvent class exists");
        } else {
            DejaGnu.fail("MouseEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.altKey == false) {
	    DejaGnu.pass("MouseEvent.altKey property exists");
	} else {
	    DejaGnu.fail("MouseEvent.altKey property doesn't exist");
	}
	if (x1.buttonDown == false) {
	    DejaGnu.pass("MouseEvent.buttonDown property exists");
	} else {
	    DejaGnu.fail("MouseEvent.buttonDown property doesn't exist");
	}
	if (x1.clickCount == 0) {
	    DejaGnu.pass("MouseEvent.clickCount property exists");
	} else {
	    DejaGnu.fail("MouseEvent.clickCount property doesn't exist");
	}
	if (x1.commandKey == false) {
	    DejaGnu.pass("MouseEvent.commandKey property exists");
	} else {
	    DejaGnu.fail("MouseEvent.commandKey property doesn't exist");
	}
	if (x1.controlKey == false) {
	    DejaGnu.pass("MouseEvent.controlKey property exists");
	} else {
	    DejaGnu.fail("MouseEvent.controlKey property doesn't exist");
	}
	if (x1.ctrlKey == false) {
	    DejaGnu.pass("MouseEvent.ctrlKey property exists");
	} else {
	    DejaGnu.fail("MouseEvent.ctrlKey property doesn't exist");
	}
	if (x1.delta == 0) {
	    DejaGnu.pass("MouseEvent.delta property exists");
	} else {
	    DejaGnu.fail("MouseEvent.delta property doesn't exist");
	}
	if (x1.localX == 0) {
	    DejaGnu.pass("MouseEvent.localX property exists");
	} else {
	    DejaGnu.fail("MouseEvent.localX property doesn't exist");
	}
	if (x1.localY == 0) {
	    DejaGnu.pass("MouseEvent.localY property exists");
	} else {
	    DejaGnu.fail("MouseEvent.localY property doesn't exist");
	}
	if (x1.relatedObject == relatedObject) {
	    DejaGnu.pass("MouseEvent.relatedObject property exists");
	} else {
	    DejaGnu.fail("MouseEvent.relatedObject property doesn't exist");
	}
	if (x1.shiftKey == false) {
	    DejaGnu.pass("MouseEvent.shiftKey property exists");
	} else {
	    DejaGnu.fail("MouseEvent.shiftKey property doesn't exist");
	}
	if (x1.stageX == 0) {
	    DejaGnu.pass("MouseEvent.stageX property exists");
	} else {
	    DejaGnu.fail("MouseEvent.stageX property doesn't exist");
	}
	if (x1.stageY == 0) {
	    DejaGnu.pass("MouseEvent.stageY property exists");
	} else {
	    DejaGnu.fail("MouseEvent.stageY property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.MouseEvent == 0) {
	    DejaGnu.pass("MouseEvent::MouseEvent() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MouseEvent() method doesn't exist");
	}
	if (x1.clone == Event) {
	    DejaGnu.pass("MouseEvent::clone() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::clone() method doesn't exist");
	}
	if (x1.toString == null) {
	    DejaGnu.pass("MouseEvent::toString() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::toString() method doesn't exist");
	}
	if (x1.updateAfterEvent == null) {
	    DejaGnu.pass("MouseEvent::updateAfterEvent() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::updateAfterEvent() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("MouseEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("MouseEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("MouseEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("MouseEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("MouseEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLICK == null) {
	    DejaGnu.pass("MouseEvent::CLICK() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CLICK() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("MouseEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("MouseEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("MouseEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("MouseEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CONNECT() method doesn't exist");
	}
	if (x1.CONTEXT == MENU) {
	    DejaGnu.pass("MouseEvent::CONTEXT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::CONTEXT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("MouseEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("MouseEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.DOUBLE == CLICK) {
	    DejaGnu.pass("MouseEvent::DOUBLE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::DOUBLE() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("MouseEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("MouseEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("MouseEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("MouseEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("MouseEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("MouseEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("MouseEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("MouseEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::INIT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("MouseEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::LOCATION() method doesn't exist");
	}
	if (x1.MIDDLE == CLICK) {
	    DejaGnu.pass("MouseEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MIDDLE == MOUSE) {
	    DejaGnu.pass("MouseEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MIDDLE == MOUSE) {
	    DejaGnu.pass("MouseEvent::MIDDLE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MIDDLE() method doesn't exist");
	}
	if (x1.MOUSE == DOWN) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == MOVE) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == OUT) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == OVER) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == UP) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.MOUSE == WHEEL) {
	    DejaGnu.pass("MouseEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::MOUSE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("MouseEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("MouseEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::OPEN() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("MouseEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("MouseEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("MouseEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("MouseEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::RESIZE() method doesn't exist");
	}
	if (x1.RIGHT == CLICK) {
	    DejaGnu.pass("MouseEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::RIGHT() method doesn't exist");
	}
	if (x1.RIGHT == MOUSE) {
	    DejaGnu.pass("MouseEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::RIGHT() method doesn't exist");
	}
	if (x1.RIGHT == MOUSE) {
	    DejaGnu.pass("MouseEvent::RIGHT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::RIGHT() method doesn't exist");
	}
	if (x1.ROLL == OUT) {
	    DejaGnu.pass("MouseEvent::ROLL() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ROLL() method doesn't exist");
	}
	if (x1.ROLL == OVER) {
	    DejaGnu.pass("MouseEvent::ROLL() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::ROLL() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("MouseEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("MouseEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::SELECT() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("MouseEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("MouseEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("MouseEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("MouseEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("MouseEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::UNLOAD() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("MouseEvent::USER() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("MouseEvent::USER() method exists");
	} else {
	    DejaGnu.fail("MouseEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

