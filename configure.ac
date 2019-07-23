# Process this file with autoconf to produce a configure script.
#

# Prelude
AC_INIT([button],[1.1],[cardiel@ucm.es])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([config.h.in])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Checks for programs
AC_PROG_F77
AM_PROG_AR
LT_INIT

# Safety check
AC_CONFIG_SRCDIR([src/samplebutton.f])

# Define directories to search for libraries
AC_MSG_CHECKING([uname -s for detecting host operating system])
OSNAME=`uname -s`
case "$OSNAME" in
  Darwin*)
    AC_MSG_RESULT(Darwin)
    LDFLAGS="$LDFLAGS -L/opt/local/lib"
  ;;
  Linux*)
    AC_MSG_RESULT(Linux)
    LDFLAGS="$LDFLAGS -L/usr/local/pgplot"
  ;;
esac

# Checks for libraries
AC_MSG_RESULT(LDFLAGS set to... $LDFLAGS)
AC_CHECK_LIB([X11], main,,AC_MSG_ERROR(X11 library not found))
AC_CHECK_LIB([pgplot], main,,AC_MSG_ERROR(pgplot library not found))
# Define in LIBS all the previous libraries
LIBS="$LIBS"
AC_MSG_RESULT(LIBS set to... $LIBS)

# Output files
AC_CONFIG_FILES([Makefile 
                 src/Makefile])

AC_OUTPUT

