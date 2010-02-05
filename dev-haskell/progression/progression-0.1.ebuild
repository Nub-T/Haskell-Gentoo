# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

CABAL_FEATURES="lib profile haddock hscolour"
inherit haskell-cabal

DESCRIPTION="Automates the recording and graphing of criterion benchmarks"
HOMEPAGE="http://chplib.wordpress.com/2010/02/04/progression-supporting-optimisation-in-haskell/"
SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

HASKELLDEPS="dev-haskell/criterion
		dev-haskell/filepath
		dev-haskell/haskeline
		dev-haskell/txt-sushi"
RDEPEND=">=dev-lang/ghc-6.6.1
		${HASKELLDEPS}"
DEPEND="dev-haskell/cabal
		${RDEPEND}"
