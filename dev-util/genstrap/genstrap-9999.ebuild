# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Gentoo base system bootstrap"
HOMEPAGE="https://gitlab.com/xgqt/genstrap"
EGIT_REPO_URI="
	https://gitlab.com/xgqt/${PN}.git
	https://github.com/xgqt/${PN}.git
"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="
	app-shells/bash
	net-misc/wget
"
