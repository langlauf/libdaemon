#!/bin/sh
# $Id: bootstrap.sh 17 2003-07-06 23:19:00Z lennart $

if [ "x$1" = "xam" ] ; then
    set -ex
    automake -a -c --foreign
    ./config.status
else 
    set -ex

    make maintainer-clean || true

    rm -rf autom4te.cache
    rm -f config.cache

    aclocal
    libtoolize -c --force
    autoheader
    automake -a -c --foreign
    autoconf -Wall

    ./configure "$@"
fi

