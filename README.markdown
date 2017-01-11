# tslib Debian package

The Debian package of [tslib](https://github.com/kergoth/tslib) version 1.3

### how to build manually
- get tslib-1.3's tarball
- extract it and put this debian directory in
- run `uscan --force-download` and `debuild -us -uc` to build everything

For prerequisites and details, see the [Debian Wiki](https://wiki.debian.org/Packaging/Intro).

### how to build using the script

### background

tslib 1.0 was part of the [Debian wheezy distribution](https://packages.debian.org/source/wheezy/tslib). We actually forked the [old sources](https://anonscm.debian.org/viewvc/pkg-gpe/trunk/tslib/) and build tslib's latest stable for sid.
