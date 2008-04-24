// 
//   Copyright (C) 2007, 2008 Free Software Foundation, Inc.
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

#ifdef HAVE_CONFIG_H
#include "gnashconfig.h"
#endif


#include "BitmapMovieInstance.h"
#include "BitmapMovieDefinition.h"
#include "fill_style.h"
#include "shape.h" // for class path and class edge
#include "render.h" // for ::display

using namespace std;

namespace gnash {

BitmapMovieInstance::BitmapMovieInstance(BitmapMovieDefinition* def, character* parent)
	:
	movie_instance(def, parent)
{  
	// We need to assign a character id to the instance, or an assertion
	// will fail in character.cpp (parent==NULL || id != -1)
	character_def* chdef = def->get_character_def(1); 
	assert(chdef);
	boost::intrusive_ptr<character> ch = chdef->create_character_instance(this, 1);
	
	int depth = 1+character::staticDepthOffset;
	// TODO: check why should we set ratio to 1 here instead of default 0?
	ch->set_ratio(1);
	place_character(ch.get(), depth);
}


} // namespace gnash

