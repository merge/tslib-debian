#/bin/bash
rm -rf output
mkdir -p output/tslib-sources
cp -a debian output/tslib-sources/
cd output/tslib-sources
uscan --force-download
tar -xvf ../tslib-1.5.tar.xz --strip-components=1
cd ..
wget https://github.com/kergoth/tslib/releases/download/1.5/tslib-1.5.tar.xz.sha256
sha256sum tslib-1.5.tar.xz > tslib-1.5.hash
DIFF=$(diff tslib-1.5.tar.xz.sha256 tslib-1.5.hash)
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
