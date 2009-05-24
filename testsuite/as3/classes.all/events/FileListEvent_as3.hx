// FileListEvent_as3.hx:  ActionScript 3 "FileListEvent" class, for Gnash.
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
import flash.events.FileListEvent;
import flash.display.MovieClip;
#else
import flash.FileListEvent;
import flash.MovieClip;
#end
import flash.Lib;
import Type;

// import our testing API
import DejaGnu;

// Class must be named with the _as3 suffix, as that's the same name as the file.
class FileListEvent_as3 {
    static function main() {
        var x1:FileListEvent = new FileListEvent();

        // Make sure we actually get a valid class        
        if (x1 != null) {
            DejaGnu.pass("FileListEvent class exists");
        } else {
            DejaGnu.fail("FileListEvent class doesn't exist");
        }
// Tests to see if all the properties exist. All these do is test for
// existance of a property, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.files == 0) {
	    DejaGnu.pass("FileListEvent.files property exists");
	} else {
	    DejaGnu.fail("FileListEvent.files property doesn't exist");
	}

// Tests to see if all the methods exist. All these do is test for
// existance of a method, and don't test the functionality at all. This
// is primarily useful only to test completeness of the API implementation.
	if (x1.FileListEvent == 0) {
	    DejaGnu.pass("FileListEvent::FileListEvent() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::FileListEvent() method doesn't exist");
	}
	if (x1.ACTIVATE == null) {
	    DejaGnu.pass("FileListEvent::ACTIVATE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::ACTIVATE() method doesn't exist");
	}
	if (x1.ADDED == null) {
	    DejaGnu.pass("FileListEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::ADDED() method doesn't exist");
	}
	if (x1.ADDED == TO) {
	    DejaGnu.pass("FileListEvent::ADDED() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::ADDED() method doesn't exist");
	}
	if (x1.CANCEL == null) {
	    DejaGnu.pass("FileListEvent::CANCEL() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::CANCEL() method doesn't exist");
	}
	if (x1.CHANGE == null) {
	    DejaGnu.pass("FileListEvent::CHANGE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::CHANGE() method doesn't exist");
	}
	if (x1.CLOSE == null) {
	    DejaGnu.pass("FileListEvent::CLOSE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::CLOSE() method doesn't exist");
	}
	if (x1.CLOSING == null) {
	    DejaGnu.pass("FileListEvent::CLOSING() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::CLOSING() method doesn't exist");
	}
	if (x1.COMPLETE == null) {
	    DejaGnu.pass("FileListEvent::COMPLETE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::COMPLETE() method doesn't exist");
	}
	if (x1.CONNECT == null) {
	    DejaGnu.pass("FileListEvent::CONNECT() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::CONNECT() method doesn't exist");
	}
	if (x1.DEACTIVATE == null) {
	    DejaGnu.pass("FileListEvent::DEACTIVATE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::DEACTIVATE() method doesn't exist");
	}
	if (x1.DIRECTORY == LISTING) {
	    DejaGnu.pass("FileListEvent::DIRECTORY() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::DIRECTORY() method doesn't exist");
	}
	if (x1.DISPLAYING == null) {
	    DejaGnu.pass("FileListEvent::DISPLAYING() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::DISPLAYING() method doesn't exist");
	}
	if (x1.ENTER == FRAME) {
	    DejaGnu.pass("FileListEvent::ENTER() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::ENTER() method doesn't exist");
	}
	if (x1.EXITING == null) {
	    DejaGnu.pass("FileListEvent::EXITING() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::EXITING() method doesn't exist");
	}
	if (x1.FULLSCREEN == null) {
	    DejaGnu.pass("FileListEvent::FULLSCREEN() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::FULLSCREEN() method doesn't exist");
	}
	if (x1.HTML == BOUNDS) {
	    DejaGnu.pass("FileListEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == DOM) {
	    DejaGnu.pass("FileListEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::HTML() method doesn't exist");
	}
	if (x1.HTML == RENDER) {
	    DejaGnu.pass("FileListEvent::HTML() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::HTML() method doesn't exist");
	}
	if (x1.ID3 == null) {
	    DejaGnu.pass("FileListEvent::ID3() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::ID3() method doesn't exist");
	}
	if (x1.INIT == null) {
	    DejaGnu.pass("FileListEvent::INIT() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::INIT() method doesn't exist");
	}
	if (x1.LOCATION == CHANGE) {
	    DejaGnu.pass("FileListEvent::LOCATION() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::LOCATION() method doesn't exist");
	}
	if (x1.MOUSE == LEAVE) {
	    DejaGnu.pass("FileListEvent::MOUSE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::MOUSE() method doesn't exist");
	}
	if (x1.NETWORK == CHANGE) {
	    DejaGnu.pass("FileListEvent::NETWORK() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::NETWORK() method doesn't exist");
	}
	if (x1.OPEN == null) {
	    DejaGnu.pass("FileListEvent::OPEN() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::OPEN() method doesn't exist");
	}
	if (x1.REMOVED == null) {
	    DejaGnu.pass("FileListEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::REMOVED() method doesn't exist");
	}
	if (x1.REMOVED == FROM) {
	    DejaGnu.pass("FileListEvent::REMOVED() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::REMOVED() method doesn't exist");
	}
	if (x1.RENDER == null) {
	    DejaGnu.pass("FileListEvent::RENDER() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::RENDER() method doesn't exist");
	}
	if (x1.RESIZE == null) {
	    DejaGnu.pass("FileListEvent::RESIZE() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::RESIZE() method doesn't exist");
	}
	if (x1.SCROLL == null) {
	    DejaGnu.pass("FileListEvent::SCROLL() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::SCROLL() method doesn't exist");
	}
	if (x1.SELECT == null) {
	    DejaGnu.pass("FileListEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::SELECT() method doesn't exist");
	}
	if (x1.SELECT == MULTIPLE) {
	    DejaGnu.pass("FileListEvent::SELECT() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::SELECT() method doesn't exist");
	}
	if (x1.SOUND == COMPLETE) {
	    DejaGnu.pass("FileListEvent::SOUND() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::SOUND() method doesn't exist");
	}
	if (x1.TAB == CHILDREN) {
	    DejaGnu.pass("FileListEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == ENABLED) {
	    DejaGnu.pass("FileListEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::TAB() method doesn't exist");
	}
	if (x1.TAB == INDEX) {
	    DejaGnu.pass("FileListEvent::TAB() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::TAB() method doesn't exist");
	}
	if (x1.UNLOAD == null) {
	    DejaGnu.pass("FileListEvent::UNLOAD() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::UNLOAD() method doesn't exist");
	}
	if (x1.USER == IDLE) {
	    DejaGnu.pass("FileListEvent::USER() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::USER() method doesn't exist");
	}
	if (x1.USER == PRESENT) {
	    DejaGnu.pass("FileListEvent::USER() method exists");
	} else {
	    DejaGnu.fail("FileListEvent::USER() method doesn't exist");
	}

        // Call this after finishing all tests. It prints out the totals.
        DejaGnu.done();
    }
}

// local Variables:
// mode: C++
// indent-tabs-mode: t
// End:

