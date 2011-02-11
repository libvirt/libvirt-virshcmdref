#!/bin/sh

set -e
set -v

contentdir=$AUTOBUILD_INSTALL_ROOT/share/publican/Common_Content

rm -rf html
make clean || :

make contentdir=$contentdir
mv output/publican/tmp/en-US/html html

if [ -x /usr/bin/rpmbuild ]
then
   make publicanrpm contentdir=$contentdir
fi
