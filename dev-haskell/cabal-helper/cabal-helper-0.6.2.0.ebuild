# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.6.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Simple interface to some of Cabal's configuration state used by ghc-mod"
HOMEPAGE="http://hackage.haskell.org/package/cabal-helper"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # runs external cabal and downloads things

RDEPEND=">=dev-haskell/cabal-1.14:=[profile?] <dev-haskell/cabal-1.23:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/temporary:=[profile?]
	dev-haskell/transformers:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( dev-haskell/extra )
"
