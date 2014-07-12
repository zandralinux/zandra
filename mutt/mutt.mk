TARG = mutt
DEPS = libressl ncurses

INSTALL_MAN1 = `{ ls -1 doc/*.1 }
INSTALL_BIN = mutt smime_keys pgpring pgpewrap

<$mkbuild/mk.common

mutt:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# https://sourceware.org/bugzilla/show_bug.cgi?id=16698
	test x"$arch" = x"arm" && export LDFLAGS="`printf "%s" \"$LDFLAGS\" | sed 's@-Wl,--gc-sections@@g'`"
	#
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls \
		--disable-iconv \
		--with-ssl \
		--with-curses \
		--with-mailpath="/var/spool/mail" \
		--enable-static
	# make doc/makedoc.c on host.
	printf 'all:\n\ttrue\nclean:\n\ttrue' > doc/Makefile
	$HOSTCC doc/makedoc.c -o doc/makedoc -D_GNU_SOURCE -D_BSD_SOURCE -DHAVE_STRERROR
	#
	make -j$nprocs
