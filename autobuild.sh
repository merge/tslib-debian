#/bin/bash

VERSION="1.9"

rm -rf output
mkdir -p output/tslib-sources
cp -a debian output/tslib-sources/
cd output/tslib-sources
uscan --force-download
tar -xvf ../tslib-${VERSION}.tar.xz --strip-components=1
debuild
