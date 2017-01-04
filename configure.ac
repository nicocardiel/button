# Process this file with autoconf to produce a configure script.
AC_INIT(Button,1.0.1,[ncl@astrax.fis.ucm.es])
AC_CONFIG_SRCDIR(config.h.in)
AM_INIT_AUTOMAKE
AM_CONFIG_HEADER(config.h)

# Checks for programs.
AC_PROG_F77
AC_PROG_INSTALL
AC_PROG_MAKE_SET

AC_PROG_LIBTOOL

# Checks for libraries.
STTL_LIB_PGPLOT
LIBS="$LIBS $PGPLOT_LIBS"

AC_CONFIG_FILES([Makefile
                m4/Makefile
                src/Makefile])
AC_OUTPUT
