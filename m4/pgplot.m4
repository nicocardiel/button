dnl Macro to check for pgplot

AC_DEFUN([STTL_LIB_PGPLOT],
[AC_REQUIRE([AC_PATH_X])
if test "$no_x" = yes; then
AC_MSG_WARN([X is not enabled])
fi
if test "$no_x" = disable; then
AC_MSG_WARN([X is not enabled])
fi

if test -n "$x_libraries"; then
ucm_pgplot_ladd="-L$x_libraries -lX11"
else
ucm_pgplot_ladd="-lX11"
fi

AC_LANG_PUSH([Fortran 77])
AC_CHECK_LIB(pgplot,pgopen,ucm_has_pgp=yes,ucm_have_pgp=no,$ucm_pgplot_ladd)
AC_LANG_POP([Fortran 77])
AC_MSG_CHECKING(for working Fortran pgplot lib)
if test "$ucm_has_pgp" = yes; then
AC_MSG_RESULT(yes)
AC_SUBST(ucm_has_pgp)
PGPLOT_LIBS="-lpgplot $ucm_pgplot_ladd"
else
AC_MSG_RESULT(no)
fi
])

AC_DEFUN([STTL_LIB_CPGPLOT],
[AC_REQUIRE([AC_PATH_X])
AC_REQUIRE([STTL_LIB_PGPLOT])
if test "$ucm_has_pgp" = yes; then
AC_CHECK_HEADER(cpgplot.h,ucm_have_cpgp_h=yes,ucm_have_cpgp_h=no)
AC_REQUIRE([AC_F77_LIBRARY_LDFLAGS])
AC_CHECK_LIB(cpgplot,cpgopen,ucm_have_cpgp_a=yes,\
	ucm_have_cpgp_a=no,$PGPLOT_LIBS $FLIBS)

AC_MSG_CHECKING(for working C pgplot lib and header)
if test "$ucm_have_cpgp_h" = yes -a "$have_ucm_cpgp_a"=yes; then
ucm_has_cpgp=yes
AC_MSG_RESULT(yes)
AC_SUBST(ucm_has_cpgp)
AC_DEFINE(HAVE_CPGPLOT,1,[Enable compilation with CPGPLOT libs])
CPGPLOT_LIBS="-lcpgplot $PGPLOT_LIBS $FLIBS"
else
AC_MSG_RESULT(no)
fi
else
AC_MSG_WARN(without FORTRAN pgplot you cannot use C pgplot)
fi
])
