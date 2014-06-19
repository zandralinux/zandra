TARG = xorgmkfontscale
DEPS = freetype libpng zlib xorgxproto xorglibfontenc

<$mkbuild/mk.common-noinst

xorgmkfontscale:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export MKFONTSCALE_CFLAGS="$CFLAGS"
	export MKFONTSCALE_LIBS="$LDFLAGS"
	export X11_CFLAGS="$CFLAGS"
	export X11_LIBS="$LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
