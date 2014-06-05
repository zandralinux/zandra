TARG = libtorrent
DEPS = openssl libsigcpp

<$mkbuild/mk.common-noinst

libtorrent:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export OPENSSL_CFLAGS="-I${openssl_includedir}"
	export OPENSSL_LIBS="-L${openssl_libdir} -lssl -lcrypto -lz"
	export STUFF_CFLAGS="-I${libsigcpp_includedir} -I${libsigcpp_libdir}/sigc++-2.0/include"
	export STUFF_LIBS="-L${libsigcpp_libdir} -lsigc-2.0"
	#
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--enable-ipv6
	# make install for use as a dependency.
	make -j$nprocs DESTDIR=`pwd`/lib install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
