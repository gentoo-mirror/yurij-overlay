# Copyright 2017 Yurij Mikhalevich <yurij@mikhalevi.ch>
# Distributed under the terms of the MIT License

EAPI=6

inherit unpacker

MY_PN=zoom

DESCRIPTION="Video conferencing and web conferencing service"
BASE_SERVER_URI="https://zoom.us"
HOMEPAGE="${BASE_SERVER_URI}"
SRC_URI="${BASE_SERVER_URI}/client/${PV}/${MY_PN}_amd64.deb"

LICENSE="ZOOM"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror"

IUSE="pulseaudio gstreamer"

DEPEND=""
RDEPEND="${DEPEND}
	pulseaudio? ( media-sound/pulseaudio )
	gstreamer? ( media-libs/gst-plugins-base )
	dev-db/sqlite
	dev-libs/glib
	dev-libs/nss
	dev-libs/libxslt
	media-libs/fontconfig
	media-libs/mesa
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXi
	x11-libs/libXrender"

S=${WORKDIR}

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	cp -Rp "${S}/"* "${D}"
}
