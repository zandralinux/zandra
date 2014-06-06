TARG = xorgvideofbdev
DEPS = xorgserver xorgprotoall xorglibpixman xorglibpciaccess 

<$mkbuild/mk.common-noinst

xorgvideofbdev:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XORG_CFLAGS="${CFLAGS}"
	export XORG_LIBS="${LDFLAGS}"
	export PCIACCESS_CFLAGS="${CFLAGS}"
	export PCIACCESS_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
