# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.4
#hackport: flags: build-examples:examples

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Library for creating command-line interfaces (colors, menus, etc.)"
HOMEPAGE="https://github.com/pjones/byline"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND=">=dev-haskell/ansi-terminal-0.6:=[profile?] <dev-haskell/ansi-terminal-0.12:=[profile?]
	>=dev-haskell/colour-2.3:=[profile?] <dev-haskell/colour-2.4:=[profile?]
	>=dev-haskell/exceptions-0.8:=[profile?] <dev-haskell/exceptions-0.11:=[profile?]
	>=dev-haskell/haskeline-0.7:=[profile?] <dev-haskell/haskeline-0.9:=[profile?]
	>=dev-haskell/mtl-2.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/terminfo-hs-0.1:=[profile?] <dev-haskell/terminfo-hs-0.3:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-lang/ghc-8.0.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-2.2
"

src_prepare() {
	default

	cabal_chdeps \
		'haskeline     >= 0.7  && < 0.8' 'haskeline     >= 0.7  && < 0.9'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag examples build-examples)
}
