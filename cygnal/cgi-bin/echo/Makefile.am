## Process this file with automake to generate Makefile.in
# 
# Copyright (C) 2005, 2006, 2007, 2008, 2009, 2010 Free Software Foundation, Inc.
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

AUTOMAKE_OPTIONS = 

# this is where Gnash plugins get installed
cgidir = $(libdir)/cygnal/plugins

cgi_LTLIBRARIES = echo.la # gateway.la

GNASH_LIBS = \
	$(top_builddir)/libbase/libgnashbase.la \
	$(top_builddir)/libcore/libgnashcore.la \
	../../libamf/libgnashamf.la \
	../../libnet/libgnashnet.la \
	$(BOOST_LIBS) \
	$(PTHREAD_LIBS) \
	$(NULL)

INCLUDES = \
        -I$(top_srcdir)/libbase \
	-I$(top_srcdir)/libcore \
	-I$(top_srcdir)/libltdl \
	-I$(top_srcdir)/cygnal \
        -I$(top_srcdir)/cygnal/libamf \
	-I$(top_srcdir)/cygnal/libnet \
	$(BOOST_CFLAGS)

echo_la_SOURCES = echo.cpp echo.h
echo_la_LDFLAGS = -module -avoid-version -no-undefined
echo_la_LIBADD  =  $(GNASH_LIBS) $(top_builddir)/cygnal/libcygnal.la

# gateway_la_SOURCES = gateway.cpp gateway.h 
# gateway_la_LDFLAGS = -module -avoid-version -no-undefined
# gateway_la_LIBADD   = $(GNASH_LIBS) $(top_builddir)/cygnal/libcygnal.la

CLEANFILES = \
      gnash-dbg.log

install-cgiLTLIBRARIES: $(cgi_LTLIBRARIES)
	test -d "$(DESTDIR)$(cgidir)" || $(mkinstalldirs) "$(DESTDIR)$(cgidir)"
	$(LIBTOOL) --mode=install $(INSTALL) $(INSTALL_STRIP_FLAG) $(cgi_LTLIBRARIES) "$(DESTDIR)$(cgidir)/$(cgi_LTLIBRARIES)"
	$(RM) $(DESTDIR)$(cgidir)/*.a $(DESTDIR)$(cgidir)/*.la
