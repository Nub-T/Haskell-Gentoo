# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Haskell docs tool"
HOMEPAGE="https://github.com/mvoidex/hdocs"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/aeson-0.7.0:=[profile?]
	>=dev-haskell/aeson-pretty-0.7.0:=[profile?]
	>=dev-haskell/cabal-1.22.2:=[profile?]
	>=dev-haskell/ghc-paths-0.1.0:=[profile?]
	>=dev-haskell/haddock-api-2.16.0:=[profile?] <dev-haskell/haddock-api-2.25:=[profile?]
	>=dev-haskell/haddock-library-1.6:=[profile?] <dev-haskell/haddock-library-1.10:=[profile?]
	>=dev-haskell/mtl-2.1.0:=[profile?]
	>=dev-haskell/network-2.4.0:=[profile?]
	>=dev-haskell/text-1.1.0:=[profile?]
	>=dev-lang/ghc-7.8.1:=[profile?]
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
"
