dnl  
dnl    Copyright (C) 2005, 2006 Free Software Foundation, Inc.
dnl  
dnl  This program is free software; you can redistribute it and/or modify
dnl  it under the terms of the GNU General Public License as published by
dnl  the Free Software Foundation; either version 2 of the License, or
dnl  (at your option) any later version.
dnl  
dnl  This program is distributed in the hope that it will be useful,
dnl  but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl  GNU General Public License for more details.
dnl  You should have received a copy of the GNU General Public License
dnl  along with this program; if not, write to the Free Software
dnl  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

dnl Linking Gnash statically or dynamically with other modules is making a
dnl combined work based on Gnash. Thus, the terms and conditions of the GNU
dnl General Public License cover the whole combination.
dnl
dnl As a special exception, the copyright holders of Gnash give you
dnl permission to combine Gnash with free software programs or libraries
dnl that are released under the GNU LGPL and with code included in any
dnl release of Talkback distributed by the Mozilla Foundation. You may
dnl copy and distribute such a system following the terms of the GNU GPL
dnl for all but the LGPL-covered parts and Talkback, and following the
dnl LGPL for the LGPL-covered parts.
dnl
dnl Note that people who make modified versions of Gnash are not obligated
dnl to grant this special exception for their modified versions; it is their
dnl choice whether to do so. The GNU General Public License gives permission
dnl to release a modified version without this exception; this exception
dnl also makes it possible to release a modified version which carries
dnl forward this exception.
dnl  
dnl 

AC_DEFUN([GNASH_PATH_OPENGL],
[
dnl   AC_ARG_ENABLE(opengl, [  --disable-opengl        Disable support for OpenGL],
dnl   [case "${enableval}" in
dnl     yes) opengl=no  ;;
dnl     no)  opengl=yes ;;
dnl     *)   AC_MSG_ERROR([bad value ${enableval} for disable-opengl option]) ;;
dnl   esac], opengl=yes)
  opengl=yes
  if test x"$opengl" = x"yes"; then
    dnl Look for the headers.
    AC_ARG_WITH(opengl_includes, [  --with-opengl-includes  directory where OpenGL headers are], with_opengl_includes=${withval})
    AC_CACHE_VAL(ac_cv_path_opengl_includes,[
    if test x"${with_opengl_includes}" != x ; then
      if test -f ${with_opengl_includes}/GL/gl.h -a -f ${with_opengl_includes}/GL/glu.h ; then
        ac_cv_path_opengl_includes=`(cd ${with_opengl_includes}; pwd)`
      else
        AC_MSG_ERROR([${with_opengl_includes} directory doesn't contain GL/gl.h])
      fi
    fi])

    dnl If the include path hasn't been specified, go look for it.
    if test x"${ac_cv_path_opengl_includes}" = x; then
      AC_CHECK_HEADERS(GL/gl.h, [ac_cv_path_opengl_includes=""],[
      if test x"${ac_cv_path_opengl_includes}" = x; then
        AC_MSG_CHECKING([for OpenGL headers])
        incllist="${prefix}/include /usr/include /usr/local/include /opt/mesa/include /opt/include /usr/X11R6/include /usr/pkg/include .. ../.."

        for i in $incllist; do
          if test -f $i/GL/gl.h; then
            if test x"$i" != x"/usr/include"; then
              ac_cv_path_opengl_includes="-I$i"
              break
            else
              ac_cv_path_opengl_includes=""
              break
            fi
	    if test -f $i/GL/glu.h; then
	      AC_MSG_WARN([GL/glu.h not installed!])
	    fi
          fi
        done
      fi])
    else
      AC_MSG_RESULT(-I${ac_cv_path_opengl_includes})
      if test x"${ac_cv_path_opengl_includes}" != x"/usr/include"; then
        ac_cv_path_opengl_includes="-I${ac_cv_path_opengl_includes}"
       else
        ac_cv_path_opengl_includes=""
      fi
    fi

    if test x"${ac_cv_path_opengl_includes}" != x ; then
      OPENGL_CFLAGS="${ac_cv_path_opengl_includes}"
      AC_MSG_RESULT(${ac_cv_path_opengl_includes})
    else
      OPENGL_CFLAGS=""
    fi

    dnl Look for the libraries.
    AC_ARG_WITH(opengl_lib, [  --with-opengl-lib directory where OpenGL libraries are], with_opengl_lib=${withval})
    AC_CACHE_VAL(ac_cv_path_opengl_lib,[
    if test x"${with_opengl_lib}" != x ; then
      if test -f ${with_opengl_lib}/libGL.a -o -f ${with_opengl_lib}/libGL.so; then
        ac_cv_path_opengl_lib="-L`(cd ${with_opengl_lib}; pwd)` -lGL -lGLU"
      else
        if test -f ${with_opengl_lib}/libopengl32.a -o; then
          ac_cv_path_opengl_lib="-L`(cd ${with_opengl_lib}; pwd) -lopengl32 -lglu32`"
          AC_MSG_ERROR([${with_opengl_lib} directory doesn't contain libGL.])
        fi
      fi
    fi
    ])

    if test x"${ac_cv_path_opengl_lib}" = x; then
      AC_CHECK_LIB(GL, glBegin, [ac_cv_path_opengl_lib="-lGL -lGLU"],[
        libslist="/usr/i586-mingw32msvc/lib ${prefix}/lib64 ${prefix}/lib32 ${prefix}/lib /usr/lib64 /usr/lib32 /usr/lib /usr/local/lib /opt/lib /usr/pkg/lib /usr/X11R6/lib /usr/lib/opengl/xorg-x11/lib /usr/lib64/opengl/xorg-x11/lib /usr/lib64/opengl/xorg-x11/lib64  /opt/mesa/lib64 /opt/mesa/lib .. ../.."
        for i in $libslist; do
          if test -f $i/libGLU.a -o -f $i/libGLU.so; then
            if test x"$i" != x"/usr/lib"; then
              ac_cv_path_opengl_lib="-L$i -lGL -lGLU"
              break
	    else
              ac_cv_path_opengl_lib="-lGL -lGLU"
	    fi
          else
	    if test -f $i/libopengl32.a; then
	      ac_cv_path_opengl_lib="-L$i -lopengl32 -lglu32"
	      break
	    else
	      ac_cv_path_opengl_lib="-lopengl32 -lglu32"
	    fi
          fi
          if test -f $i/libGLU.a -o -f $i/libGLU.so; then
	    AC_MSG_WARN([libGLU not installed!])
	  fi
        done])
    else
      if test -f ${ac_cv_path_opengl_lib}/libGLU.a -o -f ${ac_cv_path_opengl_lib}/libGLU.so; then
        if test x"${ac_cv_path_opengl_lib}" != x"/usr/lib"; then
          ac_cv_path_opengl_lib="-L${ac_cv_path_opengl_lib} -lGL -lGLU"
         else
          ac_cv_path_opengl_lib="-lGL -lGLU"
        fi
      fi
    fi

     if test x"${ac_cv_path_opengl_libraries}" != x ; then
      ac_cv_path_opengl_lib="-L${ac_cv_path_opengl_lib} -LGL -lGLU"
     fi
  fi

  if test x"${ac_cv_path_opengl_lib}" != x ; then
      OPENGL_LIBS="${ac_cv_path_opengl_lib}"
  else
      OPENGL_LIBS=""
  fi

  AC_SUBST(OPENGL_CFLAGS)
  AC_SUBST(OPENGL_LIBS)
])
