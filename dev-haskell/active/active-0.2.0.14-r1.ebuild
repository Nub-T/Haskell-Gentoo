# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# ebuild generated by hackport 0.6.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Abstractions for animation"
HOMEPAGE="https://hackage.haskell.org/package/active"
SRC_URI="
	https://hackage.haskell.org/package/${P}/${P}.tar.gz
	https://hackage.haskell.org/package/${P}/revision/1.cabal -> ${PF}.cabal
	"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/lens-4.0:=[profile?] <dev-haskell/lens-4.20:=[profile?]
	>=dev-haskell/linear-1.14:=[profile?] <dev-haskell/linear-1.22:=[profile?]
	>=dev-haskell/semigroupoids-1.2:=[profile?] <dev-haskell/semigroupoids-5.4:=[profile?]
	>=dev-haskell/semigroups-0.1:=[profile?] <dev-haskell/semigroups-0.20:=[profile?]
	>=dev-haskell/vector-0.10:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18
	test? ( >=dev-haskell/quickcheck-2.9 )
"

src_prepare() {
	default

	# Pull new cabal from upstream
	cp "${DISTDIR}/${PF}.cabal" "${S}/${PN}.cabal" || die

	# upstream has not fixed these dep yet
	cabal_chdeps \
		'base >= 4.0 && < 4.14' 'base >= 4.0' \
		'QuickCheck >= 2.9 && < 2.14' 'QuickCheck >= 2.9'
}