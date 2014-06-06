TARG = xorgvideointel
DEPS = xorgserver xorgprotoall xorglibpixman

<$mkbuild/mk.common-noinst

xorgvideointel:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XORG_CFLAGS="${CFLAGS}"
	export XORG_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-pciaccess \
		--enable-static \
		--enable-xvmc
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
