TARG = alsautils
DEPS = alsalib ncurses

<$mkbuild/mk.common-noinst

alsautils:QV:
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-xmlto \
		--disable-alsatest \
		--disable-nls \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
