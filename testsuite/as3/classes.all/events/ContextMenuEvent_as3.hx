// ContextMenuEvent_as3.hx:  ActionScript 3 "ContextMenuEvent" class, for Gnash.
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
import flash.events.ContextMenuEvent;
import flash.display.MovieClip;
#else
import flash.ContextMenuEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class ContextMenuEvent_as3 {
    static function main() {
        var x1:ContextMenuEvent = new ContextMenuEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("ContextMenuEvent class exists");
        } else {
            DejaGnu.fail("ContextMenuEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.contextMenuOwner == contextMenuOwner) {
	    DejaGnu.pass("ContextMenuEvent.contextMenuOwner property exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent.contextMenuOwner property doesn't exist");
	}
	if (x1.mouseTarget == mouseTarget) {
	    DejaGnu.pass("ContextMenuEvent.mouseTarget property exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent.mouseTarget property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.ContextMenuEvent == InteractiveObject) {
	    DejaGnu.pass("ContextMenuEvent::ContextMenuEvent() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ContextMenuEvent() method doesn't exist");
	}
	if (x1.clone == Event) {
	    DejaGnu.pass("ContextMenuEvent::clone() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::clone() method doesn't exist");
	}
	if (x1.toString == null) {
	    DejaGnu.pass("ContextMenuEvent::toString() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::toString() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("ContextMenuEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("ContextMenuEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("ContextMenuEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("ContextMenuEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("ContextMenuEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("ContextMenuEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("ContextMenuEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("ContextMenuEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("ContextMenuEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::CONNECT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("ContextMenuEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("ContextMenuEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("ContextMenuEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("ContextMenuEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("ContextMenuEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("ContextMenuEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("ContextMenuEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("ContextMenuEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("ContextMenuEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("ContextMenuEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::INIT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("ContextMenuEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::LOCATION() method doesn't exist");
	}
	if (x1.MENU == ITEM) {
	    DejaGnu.pass("ContextMenuEvent::MENU() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::MENU() method doesn't exist");
	}
	if (x1.MENU == SELECT) {
	    DejaGnu.pass("ContextMenuEvent::MENU() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::MENU() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("ContextMenuEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::MOUSE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("ContextMenuEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("ContextMenuEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::OPEN() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("ContextMenuEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("ContextMenuEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("ContextMenuEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("ContextMenuEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::RESIZE() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("ContextMenuEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("ContextMenuEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::SELECT() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("ContextMenuEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("ContextMenuEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("ContextMenuEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("ContextMenuEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("ContextMenuEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::UNLOAD() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("ContextMenuEvent::USER() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("ContextMenuEvent::USER() method exists");
	} else {
	    DejaGnu.fail("ContextMenuEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

