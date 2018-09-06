#/bin/bash

VERSION="1.17"

set -e

rm -rf output
mkdir -p output/tslib-sources
cp -a debian output/tslib-sources/
cd output/tslib-sources
uscan --force-download
tar -xvf ../tslib-${VERSION}.tar.xz --strip-components=1
mv ../tslib-${VERSION}.tar.xz ../tslib_${VERSION}.orig.tar.xz
debuild
