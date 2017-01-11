#/bin/bash
rm -rf output
mkdir -p output/tslib-sources
cp -a debian output/tslib-sources/
cd output/tslib-sources
uscan --force-download
tar -xvf ../tslib-1.3.tar.bz2 --strip-components=1
debuild -us -uc
