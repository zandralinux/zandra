TARG = xorgxkbcomp
DEPS = xorglibxkbfile xorglibx11 xorglibxcb xorglibxau xorgxproto \
	  xorgkbproto xorglibxdmcp

<$mkbuild/mk.common-noinst

xorgxkbcomp:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XKBCOMP_CFLAGS="${CFLAGS}"
	export XKBCOMP_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
