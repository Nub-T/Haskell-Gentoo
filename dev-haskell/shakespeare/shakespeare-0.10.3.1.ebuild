# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# ebuild generated by hackport 0.2.13

EAPI="4"

CABAL_FEATURES="lib profile haddock hscolour hoogle"
inherit haskell-cabal

DESCRIPTION="A toolkit for making compile-time interpolated templates"
HOMEPAGE="http://www.yesodweb.com/book/templates"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test" # Had to comment stuff out to convince the test to compile

RDEPEND="<dev-haskell/parsec-4
		<dev-haskell/text-0.12
		>=dev-lang/ghc-6.10.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.8
		test? ( dev-haskell/hunit
			<dev-haskell/hspec-0.10
		)"

src_prepare() {
	cp -pR "${FILESDIR}/${P}/test" "${S}/test" \
		|| die "Could not copy missing test files"
	cp -pR "${FILESDIR}/${P}/test.hs" "${S}/test.hs" \
		|| die "Could not copy missing test.hs file"
}

src_configure() {
	cabal_src_configure $(use_enable test tests)
}
