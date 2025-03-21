# Process this file with autoconf to produce a configure script.
#

# Prelude
AC_INIT([button],[1.1],[cardiel@ucm.es])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_MACRO_DIRS([m4])

# Checks for programs
AC_PROG_FC
AM_PROG_AR
LT_INIT

# Safety check
AC_CONFIG_SRCDIR([src/samplebutton.f90])

# Define directories to search for libraries
AC_MSG_CHECKING([uname -s for detecting host operating system])
OSNAME=`uname -s`
case "$OSNAME" in
  Darwin*)
    AC_MSG_RESULT(Darwin)
    MY_DIR="/opt/local/lib"
    if test -d "$MY_DIR"; then
      LDFLAGS="$LDFLAGS -L$MY_DIR"
    fi
  ;;
  Linux*)
    AC_MSG_RESULT(Linux)
    MY_DIR="/usr/local/pgplot"
    if test -d "$MY_DIR"; then
      LDFLAGS="$LDFLAGS -L$MY_DIR"
    fi
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

