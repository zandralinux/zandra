TARG = rtorrent
DEPS = ncurses zlib libressl libtorrent libsigcpp curl
INSTALL_BIN = src/rtorrent
INSTALL_MAN1 = doc/rtorrent.1

<$mkbuild/mk.common

rtorrent:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export CPPFLAGS="$CFLAGS"
	export CXXFLAGS="$CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export libcurl_CFLAGS="-I${curl_includedir} -I${libressl_includedir}"
	export libcurl_LIBS="-L${curl_libdir} -lcurl -L${libressl_libdir} -lssl -lcrypto -L${zlib_libdir} -lz"
	export sigc_CFLAGS="-I${libsigcpp_includedir} -I${libsigcpp_libdir}/sigc++-2.0/include"
	export sigc_LIBS="-L${libsigcpp_libdir} -lsigc-2.0"
	export libtorrent_CFLAGS="-I${libtorrent_includedir}"
	export libtorrent_LIBS="-L${libtorrent_libdir} -ltorrent -L${ncurses_libdir}"
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--enable-ipv6
	make -j$nprocs LDFLAGS="-all-static"
