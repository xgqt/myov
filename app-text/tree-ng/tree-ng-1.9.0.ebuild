# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils toolchain-funcs flag-o-matic

DESCRIPTION="Lists directories recursively (fork of Steve Baker's tree)"
HOMEPAGE="https://gitlab.com/xgqt/tree-ng"

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="
		https://gitlab.com/xgqt/${PN}.git
		https://github.com/xgqt/${PN}.git
	"
else
	SRC_URI="
		https://gitlab.com/xgqt/${PN}/-/archive/${PV}/${P}.tar.gz
		https://github.com/xgqt/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	"
	KEYWORDS="~amd64"
fi

RESTRICT="mirror"
LICENSE="GPL-3"
SLOT="0"
IUSE="+generic"

DEPEND="
	generic? (
		!app-text/tree
	)
"

src_compile() {
	pushd src || die
	append-lfs-flags
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS} ${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
}

src_install() {
	einstalldocs

	pushd src >/dev/null || die

	newbin tree "${PN}"
	newman doc/tree.1 "${PN}.1"

	if use generic; then
		dosym "${EPREFIX}"/usr/bin/"${PN}" "${EPREFIX}"/usr/bin/tree
		doman doc/tree.1
	fi

	popd >/dev/null || die
}
