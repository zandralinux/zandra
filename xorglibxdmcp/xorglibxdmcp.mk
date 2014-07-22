TARG = xorglibxdmcp
DEPS = xorgxproto

<$mkbuild/mk.common-noinst

xorglibxdmcp:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XDMCP_CFLAGS="-I${xorgxproto_includedir}"
	export XDMCP_LIBS="-L${xorgxproto_libdir}"
	# HAVE__XEATDATAWORDS is set, but it isn't detected with configure
	# set set it.
#	CC="$CC" CFLAGS="$CFLAGS -DHAVE__XEATDATAWORDS=1" ./configure
	CC="$CC" ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
