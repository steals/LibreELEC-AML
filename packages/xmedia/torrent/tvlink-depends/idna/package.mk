# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="idna"
PKG_VERSION="3.3"
#PKG_SHA256="db438aeba52c606cf1dd9671cb746377b4baeaea923397152e91576e8404d87a"
PKG_LICENSE="BSD"
PKG_SITE="https://github.com/kjd/idna"
PKG_URL="$PKG_SITE/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 distutilscross:host"
PKG_LONGDESC="Internationalized Domain Names in Applications (IDNA)."
PKG_TOOLCHAIN="manual"

pre_configure_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
}

make_target() {
  #mkdir -p $PKG_BUILD/.python3
  #cp -r $PKG_BUILD/* .python3
  #python setup.py build --cross-compile
  #cd $PKG_BUILD/.python3
  python3 setup.py build
}

makeinstall_target() {
  #python setup.py install --root=$INSTALL --prefix=/usr
  #cd $PKG_BUILD/.python3
  python3 setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  #find $INSTALL/usr/lib/python2.7 -name "*.py" -exec rm -rf "{}" ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/$PKG_NAME-*.egg-info
}
