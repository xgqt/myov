# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="grateful_dead_lyrics"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Fortune modules from the Grateful Gead song lyrics"
HOMEPAGE="https://gitlab.com/xgqt/grateful_dead_lyrics"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/xgqt/${MY_PN}.git"
else
	SRC_URI="https://gitlab.com/xgqt/${MY_PN}/-/archive/${PV}/${MY_P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"

BDEPEND="
	games-misc/fortune-mod
"
RDEPEND="
	${BDEPEND}
"
