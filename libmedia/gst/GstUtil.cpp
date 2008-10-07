// GstUtil.cpp: Generalized Gstreamer utilities for pipeline configuration.
//
//   Copyright (C) 2008 Free Software Foundation, Inc.
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


#ifdef HAVE_CONFIG_H
#include "gnashconfig.h"
#endif

#include <sstream>

#include "GstUtil.h"
#include "log.h"

#include "swfdec_codec_gst.h"

#ifdef GST_HAS_MODERN_PBUTILS
#include <gst/pbutils/pbutils.h>
#include <gst/pbutils/missing-plugins.h>
#include <gst/pbutils/install-plugins.h>
#endif // GST_HAS_MODERN_PBUTILS


namespace gnash {
namespace media {

GstElement* GstUtil::get_audiosink_element()
{   
    //MUST be static to get a numbered name for each non-trivial pipeline created 
    static int numGnashRcSinks = 0;
    
    /*These MAY be static for CPU optimization
     *But, the memory cost at global scope is probably
     *worse overall than the CPU cost at initialization time.*/
    const std::string GNASHRCSINK = "gnashrcsink";
    const std::string sAudioSink =
      RcInitFile::getDefaultInstance().getGstAudioSink();
    
    //Can't be static. One of these must be created for each call
    GstElement* element;
    
    if(sAudioSink.find('!') != std::string::npos) //Found a non-trivial pipeline - bin it
    {
        element = gst_parse_bin_from_description(sAudioSink.c_str(), true, NULL);
        if(element != NULL)
        {
           std::ostringstream o;
           o << numGnashRcSinks++;
           gst_element_set_name(element, (GNASHRCSINK + o.str()).c_str());
        }
    }
    else //Found a trivial pipeline that doesn't need a bin
    {
        element = gst_element_factory_make(sAudioSink.c_str(), NULL);
    }
    
    if(!element)
    {
        log_debug(_("Unable to retrieve a valid audio sink from ~/.gnashrc"));
        
        element = gst_element_factory_make("autoaudiosink", NULL);
        
        if(!element)
        {
            log_debug(_("Unable to retrieve a valid audio sink from autoaudiosink"));
            
            element = gst_element_factory_make("gconfaudiosink", NULL);
            
            if(!element)
                log_error(_("Unable to retrieve a valid audio sink from gconfaudiosink\n%s"),
                        _("Sink search exhausted: you won't be able to hear sound!"));
        }
    }
    
    if(element)
    {
        log_debug(_("Got a non-NULL audio sink; its wrapper name is: %s"), _(GST_ELEMENT_NAME(element)));
    }
    
    return element;
}

// static
bool
GstUtil::check_missing_plugins(GstCaps* caps)
{
    GstElementFactory * factory = swfdec_gst_get_element_factory (caps);

    if (factory) {
        gst_object_unref(factory);
        return true;
    }

#ifdef GST_HAS_MODERN_PBUTILS
    if (!gst_install_plugins_supported()) {
        log_error(_("Missing plugin, but plugin installing not supported."));
        return false;
    }

    char* detail = gst_missing_decoder_installer_detail_new (caps);
    if (!detail) {
        log_error(_("Missing plugin, but failed to convert it to gst"
                    " missing plugin detail."));
        return false;
    }

    char* details[] =  { detail, 0 };

    GstInstallPluginsReturn ret = gst_install_plugins_sync(details, NULL);
    g_free(details[0]);

    if (ret == GST_INSTALL_PLUGINS_SUCCESS) {
        // I think a partial success is still a failure...
        return true;
    }
#else
    log_error(_("Missing plugin, but plugin installing not supported."));
#endif

    return false;
}


} // gnash.media namespace 
} // namespace gnash

// Local Variables:
// mode: C++
// End:

