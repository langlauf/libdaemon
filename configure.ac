# -*- Autoconf -*-
# $Id: configure.ac 14 2003-07-06 12:15:37Z lennart $
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.57)
AC_INIT([libdaemon], [0.1], [mzqnrzba@itaparica.org])
AC_CONFIG_SRCDIR([src/dfork.c])
AC_CONFIG_HEADERS([config.h])
AM_INIT_AUTOMAKE
AM_MAINTAINER_MODE

# Checks for programs.
AC_PROG_CC
AC_PROG_LIBTOOL

# If using GCC specifiy some additional parameters
if test "x$GCC" = "xyes" ; then
   CFLAGS="$CFLAGS -pipe -Wall"
fi

# Checks for libraries.

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([fcntl.h limits.h stdlib.h string.h syslog.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_PID_T
AC_HEADER_TIME
AC_C_VOLATILE

# Checks for library functions.
AC_FUNC_FORK
AC_FUNC_SELECT_ARGTYPES
AC_FUNC_VPRINTF
AC_CHECK_FUNCS([select strerror dup2 memset strrchr])
AC_TYPE_MODE_T

# DOXYGEN documentation generation
AC_ARG_ENABLE(doxygen,
        AC_HELP_STRING([--disable-doxygen], [Turn off doxygen usage for documentation generation]),
[case "${enableval}" in
  yes) doxygen=yes ;;
  no)  doxygen=no ;;
  *) AC_MSG_ERROR(bad value ${enableval} for --disable-doxygen) ;;
esac],[doxygen=yes])

if test x$doxygen = xyes ; then
   AC_CHECK_PROG(have_doxygen, doxygen, yes, no)

   if test x$have_doxygen = xno ; then
     AC_MSG_ERROR([*** Sorry, you have to install doxygen or use --disable-doxygen ***])
   fi
fi

AM_CONDITIONAL([USE_DOXYGEN], [test "x$doxygen" = xyes])

# LYNX documentation generation
AC_ARG_ENABLE(lynx,
        AC_HELP_STRING([--disable-lynx], [Turn off lynx usage for documentation generation]),
[case "${enableval}" in
  yes) lynx=yes ;;
  no)  lynx=no ;;
  *) AC_MSG_ERROR(bad value ${enableval} for --disable-lynx) ;;
esac],[lynx=yes])

if test x$lynx = xyes ; then
   AC_CHECK_PROG(have_lynx, lynx, yes, no)

   if test x$have_lynx = xno ; then
     AC_MSG_ERROR([*** Sorry, you have to install lynx or use --disable-lynx ***])
   fi
fi

AM_CONDITIONAL([USE_LYNX], [test "x$lynx" = xyes])

AC_CONFIG_FILES([src/Makefile Makefile doc/Makefile doc/README.html doc/doxygen.conf examples/Makefile])
AC_OUTPUT
