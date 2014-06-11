TARG = mutt
DEPS = openssl ncurses

INSTALL_MAN1 = `{ ls -1 doc/*.1}
INSTALL_BIN = mutt smime_keys pgpring pgpewrap

<$mkbuild/mk.common

mutt:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls \
		--disable-iconv \
		--with-ssl \
		--with-curses \
		--with-mailpath="/var/spool/mail" \
		--enable-static
	make -j$nprocs
