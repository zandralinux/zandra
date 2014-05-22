TARG = xorgvideofbdev
DEPS = xorgserver xorgprotoall xorglibpixman xorglibpciaccess 

<$mkbuild/mk.common-noinst

$TARG:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XORG_CFLAGS="${CFLAGS}"
	export XORG_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-pciaccess \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
