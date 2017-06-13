# Copyright 2017 Yurij Mikhalevich <yurij@mikhalevi.ch>
# Distributed under the terms of the MIT License

EAPI=6

inherit unpacker

MY_PN=timecamp
MY_P=${MY_PN}_${PV}

DESCRIPTION="Track time and app usage with timecamp.com"
BASE_SERVER_URI="https://www.timecamp.com"
HOMEPAGE="${BASE_SERVER_URI}"
SRC_URI="${BASE_SERVER_URI}/downloadsoft/${MY_P}_amd64.deb"

LICENSE="TIMECAMP"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

DEPEND=""
RDEPEND="${DEPEND}
	app-arch/xz-utils
	dev-db/sqlite
	dev-db/sqlcipher
	dev-libs/libappindicator:2
	media-libs/libpng:1.2
	net-misc/curl
	sys-apps/dbus
	virtual/libudev
	x11-libs/gtk+:2
	x11-libs/libnotify
	x11-libs/libX11"

S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -Rp "${S}/"* "${D}"
}
