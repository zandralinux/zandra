TARG = xorglibxext
DEPS = xorglibx11 xorgxproto xorgxextproto xorglibxau

<$mkbuild/mk.common-noinst

xorglibxext:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XEXT_CFLAGS="-I${xorgxextproto_libdir}"
	export XEXT_LIBS="-L${xorgxextproto_libdir}"
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
