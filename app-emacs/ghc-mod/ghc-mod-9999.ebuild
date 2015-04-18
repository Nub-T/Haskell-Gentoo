# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.4.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour test-suite"
inherit base elisp-common git-2 haskell-cabal

DESCRIPTION="Happy Haskell Programming"
HOMEPAGE="http://www.mew.org/~kazu/proj/ghc-mod/"
EGIT_REPO_URI="https://github.com/kazu-yamamoto/ghc-mod.git"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS=""
IUSE="emacs"

RDEPEND="|| ( ( <dev-lang/ghc-7.7 dev-haskell/convertible:=[profile?] )
			( >=dev-lang/ghc-7.7 ) )
	>=dev-haskell/cabal-1.10:=[profile?]
	>=dev-haskell/cabal-helper-0.3.2.0:=[profile?]
	dev-haskell/convertible:=[profile?]
	>=dev-haskell/djinn-ghc-0.0.2.1:=[profile?]
	dev-haskell/ghc-paths:=[profile?]
	dev-haskell/ghc-syb-utils:=[profile?]
	dev-haskell/haskell-src-exts:=[profile?]
	>=dev-haskell/hlint-1.8.61:=[profile?]
	dev-haskell/io-choice:=[profile?]
	dev-haskell/monad-control:=[profile?]
	>=dev-haskell/monad-journal-0.2.2.0:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?]
	dev-haskell/split:=[profile?]
	dev-haskell/syb:=[profile?]
	dev-haskell/text:=[profile?]
	dev-haskell/transformers:=[profile?]
	dev-haskell/transformers-base:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	dev-haskell/ghc-api
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.10
	test? ( >=dev-haskell/doctest-0.9.3
		|| ( ( <dev-lang/ghc-7.6.0 dev-haskell/executable-path )
			( >=dev-lang/ghc-7.6.0 ) )
		>=dev-haskell/hspec-1.8.2 )
"
SITEFILE=50${PN}-gentoo.el

PATCHES=("${FILESDIR}/${PN}-9999-gentoo.patch")

src_compile() {
	haskell-cabal_src_compile
	if use emacs ; then
		pushd elisp
		elisp-compile *.el || die
		popd
	fi
}

src_install() {
	haskell-cabal_src_install
	if use emacs ; then
		pushd "${S}"
		elisp-install ghc-mod elisp/*.{el,elc}
		elisp-site-file-install "${FILESDIR}"/${SITEFILE}
		popd
	fi
}

pkg_postinst() {
	if use emacs ; then
		elisp-site-regen
		elog "To configure ghc-mod either add this line to ~/.emacs:"
		elog "(autoload 'ghc-init \"ghc\" nil t)"
		elog "and either this line:"
		elog "(add-hook 'haskell-mode-hook (lambda () (ghc-init)))"
		elog "or if you wish to use flymake:"
		elog "(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))"
	fi
}

pkg_postrm() {
	if use emacs ; then
		elisp-site-regen
	fi
}
