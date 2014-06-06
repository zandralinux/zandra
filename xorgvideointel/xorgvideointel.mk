TARG = xorgvideointel
DEPS = xorgserver xorgprotoall xorglibpixman xorglibpciaccess xorglibdrm

<$mkbuild/mk.common-noinst

xorgvideointel:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XORG_CFLAGS="${CFLAGS}"
	export XORG_LIBS="${LDFLAGS}"
	export DRM_CFLAGS="${CFLAGS}"
	export DRM_LIBS="${LDFLAGS}"
	export PCIACCESS_CFLAGS="${CFLAGS}"
	export PCIACCESS_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-silent-rules \
		--enable-xvmc \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
