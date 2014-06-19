TARG = xf86inputkeyboard
DEPS = xorgserver xorglibpixman libpng xorglibpciaccess zlib \
	xorgprotoall
#	xorgresourceproto xorgxineramaproto xorgrandrproto xorginputproto \
#	xorgkbproto xorgvideoproto xorgscrnsaverproto xorgxextproto xorgxproto

<$mkbuild/mk.common-noinst

xf86inputkeyboard:QV:
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
