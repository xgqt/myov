# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop myov-wrapper xdg

DESCRIPTION="Quick Emacs pseudo-distribution (in ebuild form only)"
HOMEPAGE="https://gitlab.com/xgqt/myov"

# Yes, we generate this thing in the ebuild only...
# Crazy, right? ;D
SRC_URI=""
KEYWORDS="~amd64"

RESTRICT="binchecks fetch mirror strip test"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	app-editors/emacs
"

S="${WORKDIR}"

src_unpack() {
	:
}

src_install() {
	local qmacs_command="emacs -Q -nw --eval \"(setq
	auto-save-default nil
	column-number-mode t
	create-lockfiles nil
	make-backup-files nil
	ring-bell-function 'ignore
	scroll-conservatively 100
	x-select-enable-clipboard-manager nil
	)\""
	make_wrapper "${PN}" "${qmacs_command}"

	dosym ../../usr/bin/"${PN}" /usr/bin/"${PN}"-"${PV}"
	dosym ../../usr/bin/"${PN}" /usr/bin/emacs-"${PN}"
	dosym ../../usr/bin/"${PN}" /usr/bin/emacs-"${PN}"-"${PV}"

	make_desktop_entry "${PN}" "${PN^}" "emacs" \
					   "Development;TextEditor;" "Terminal=true"
}
