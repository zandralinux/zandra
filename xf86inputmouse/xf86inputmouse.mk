TARG = xf86inputmouse
DEPS = xorgserver xorglibpixman libpng xorglibpciaccess zlib xorgprotoall

<$mkbuild/mk.common-noinst

xf86inputmouse:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XORG_CFLAGS="$CFLAGS"
	export XORG_LIBS="$LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
