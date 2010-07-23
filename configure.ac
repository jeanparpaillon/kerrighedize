dnl configure.in for Kerrighedize project.
dnl Copyright 2010 Jean Parpaillon <jean.parpaillon@kerlabs.com>
dnl
dnl Process this file with autoconf to produce a configure script.

dnl autoconf version
AC_PREREQ(2.59)

dnl mandatory stuff
define([gitversion], esyscmd([sh -c "which git > /dev/null && git describe | sed -e 's/]project[-\([^-]\+\)//' | tr -d '\n' || true"]))dnl
AC_INIT([kerrighedize], [0.1]gitversion, [jean.parpaillon@kerlabs.com])
AC_DEFINE(GITVERSION, "gitversion", [GIT version])

dnl check host and target
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

AM_INIT_AUTOMAKE([-Wno-portability])
m4_ifdef([AM_SILENT_RULES],[AM_SILENT_RULES(yes)])
AC_CONFIG_MACRO_DIR([m4])

AC_PROG_MAKE_SET
AC_PROG_LN_S
AC_PROG_INSTALL

dnl files to generate with automake
AC_CONFIG_FILES([Makefile])

dnl write all stuff
AC_OUTPUT
