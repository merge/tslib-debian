#/bin/bash

VERSION="1.8"

rm -rf output
mkdir -p output/tslib-sources
cp -a debian output/tslib-sources/
cd output/tslib-sources
uscan --force-download
tar -xvf ../tslib-${VERSION}.tar.xz --strip-components=1
cd ..
wget https://github.com/kergoth/tslib/releases/download/${VERSION}/tslib-${VERSION}.tar.xz.sha256
sha256sum tslib-${VERSION}.tar.xz > tslib-${VERSION}.hash

DIFF=$(diff tslib-1.8.tar.xz.sha256 tslib-1.8.hash)

if [ "$DIFF" != "" ]
then
	echo "===================================="
	echo "|                                  |"
	echo "|         Error: bad hash          |"
	echo "|                                  |"
	echo "===================================="
else
	echo "===================================="
	echo "|                                  |"
	echo "|             hash ok              |"
	echo "|                                  |"
	echo "===================================="
fi
cd tslib-sources
debuild
