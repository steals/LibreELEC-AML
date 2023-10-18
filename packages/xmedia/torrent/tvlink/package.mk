# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2011-present Alex@ELEC (http://alexelec.in.ua)

PKG_NAME="tvlink"
PKG_VERSION="3.2.4"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/AlexELEC/TVLINK-aml"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain python3-requests pycryptodome python3-pycountry python3-isodate python3-socks python3-websocket python3-certifi PySix"
PKG_LONGDESC="TVLink: IPTV channel aggregator."
PKG_TOOLCHAIN="manual"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  : # nothing to install here
}

post_install() {
  enable_service tvlink.service
}
