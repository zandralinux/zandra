TARG = xorglibxinerama
DEPS = xorglibx11 xorgxproto xorglibxext xorgxineramaproto xorglibxau

<$mkbuild/mk.common-noinst

xorglibxinerama:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XINERAMA_CFLAGS="-I${xorgxineramaproto_includedir}"
	export XINERAMA_LIBS="-L${xorgxineramaproto_libdir}"
	# HAVE__XEATDATAWORDS is set, but it isn't detected with configure
	# set set it.
	CC="$CC" CFLAGS="$CFLAGS -DHAVE__XEATDATAWORDS=1" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
