# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2


# @ECLASS: x-xdg.eclass
# @MAINTAINER:
# Maciej Barć <xgqt@protonmail.com>
# @AUTHOR:
# Maciej Barć <xgqt@protonmail.com>
# @BLURB: execute actions if USE=X


case "${EAPI}"
in
	0 | 1 | 2 | 3 | 4 | 5 | 6 )
		die "EAPI: ${EAPI} too old"
		;;
	7 )
		;;
	* )
		die "EAPI: ${EAPI} not supported"
		;;
esac


inherit xdg-utils


# Append IUSE
IUSE+="X"


# Append depend
DEPEND+="
	X? (
		dev-util/desktop-file-utils
		x11-misc/shared-mime-info
	)
"


# Exported functions
EXPORT_FUNCTIONS pkg_postinst pkg_postrm


# @FUNCTION: X_xdg_update
# @DESCRIPTION:
# If USE=X then execute
# xdg_desktop_database_update,
# xdg_icon_cache_update
# and xdg_mimeinfo_database_update
function X_xdg_update() {
	if use X; then
		xdg_desktop_database_update
		xdg_icon_cache_update
		xdg_mimeinfo_database_update
	fi
}


# @FUNCTION: x-xdg_pkg_postinst
# @DESCRIPTION:
# Default pkg_postinst:
#
# Run X_xdg_update
function x-xdg_pkg_postinst() {
	X_xdg_update
}

# @FUNCTION: x-xdg_pkg_postrm
# @DESCRIPTION:
# Default pkg_postrm:
#
# Run X_xdg_update
function x-xdg_pkg_postrm() {
	X_xdg_update
}
