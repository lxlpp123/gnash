// ProgressEvent_as3.hx:  ActionScript 3 "ProgressEvent" class, for Gnash.
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
import flash.events.ProgressEvent;
import flash.display.MovieClip;
#else
import flash.ProgressEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class ProgressEvent_as3 {
    static function main() {
        var x1:ProgressEvent = new ProgressEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("ProgressEvent class exists");
        } else {
            DejaGnu.fail("ProgressEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.bytesLoaded == 0) {
	    DejaGnu.pass("ProgressEvent.bytesLoaded property exists");
	} else {
	    DejaGnu.fail("ProgressEvent.bytesLoaded property doesn't exist");
	}
	if (x1.bytesTotal == 0) {
	    DejaGnu.pass("ProgressEvent.bytesTotal property exists");
	} else {
	    DejaGnu.fail("ProgressEvent.bytesTotal property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.ProgressEvent == 0) {
	    DejaGnu.pass("ProgressEvent::ProgressEvent() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ProgressEvent() method doesn't exist");
	}
	if (x1.clone == Event) {
	    DejaGnu.pass("ProgressEvent::clone() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::clone() method doesn't exist");
	}
	if (x1.toString == null) {
	    DejaGnu.pass("ProgressEvent::toString() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::toString() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("ProgressEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("ProgressEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("ProgressEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("ProgressEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("ProgressEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("ProgressEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("ProgressEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("ProgressEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("ProgressEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::CONNECT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("ProgressEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("ProgressEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("ProgressEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("ProgressEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("ProgressEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("ProgressEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("ProgressEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("ProgressEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("ProgressEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("ProgressEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::INIT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("ProgressEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::LOCATION() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("ProgressEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::MOUSE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("ProgressEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("ProgressEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::OPEN() method doesn't exist");
	}
	if (x1.PROGRESS == null) {
	    DejaGnu.pass("ProgressEvent::PROGRESS() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::PROGRESS() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("ProgressEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("ProgressEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("ProgressEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("ProgressEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::RESIZE() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("ProgressEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("ProgressEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::SELECT() method doesn't exist");
	}
	if (x1.SOCKET == DATA) {
	    DejaGnu.pass("ProgressEvent::SOCKET() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::SOCKET() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("ProgressEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("ProgressEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("ProgressEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("ProgressEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("ProgressEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::UNLOAD() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("ProgressEvent::USER() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("ProgressEvent::USER() method exists");
	} else {
	    DejaGnu.fail("ProgressEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

