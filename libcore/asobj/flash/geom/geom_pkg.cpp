// geom_pkg.cpp:  ActionScript "flash.desktop" package, for Gnash.
// 
//   Copyright (C) 2005, 2006, 2007, 2008, 2009 Free Software Foundation, Inc.
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

#include "Object.h" // for getObjectInterface
#include "as_object.h"

#include "string_table.h"
#include "VM.h"
#include "MovieClip.h"

#include "ColorTransform_as.h"
#include "Matrix_as.h"
#include "Point_as.h"
#include "Rectangle_as.h"
#include "Transform_as.h"

#include "geom_pkg.h"
#include "geomclasses.h"

namespace gnash {

static as_value
get_flash_geom_package(const fn_call& /*fn*/)
{
	log_debug("Loading flash.geom package");
	as_object *pkg = new as_object(getObjectInterface());

	// Call the [objectname]_init() function for each class.
	int i = 0;
	do {
	    asclasses[i](*pkg);
	} while (asclasses[++i] != 0);

	return pkg;
}

void
flash_geom_package_init(as_object& where)
{
	string_table& st = where.getVM().getStringTable();

    // TODO: this may not be correct, but it should be enumerable.
    const int flags = 0;
	where.init_destructive_property(st.find("geom"),
			get_flash_geom_package, flags);
}


} // end of gnash namespace