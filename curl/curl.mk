# make deps: perl
# src/tool_hugehelp.c is automatically generated by the mkhelp.pl perl script
TARG = curl
DEPS = zlib libressl cares
INSTALL_BIN = src/curl
INSTALL_MAN1 = \
	docs/curl.1 \
	docs/curl-config.1

<$mkbuild/mk.common

curl:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="" \
		--bindir="$BINDIR" \
		--sbindir="$BINDIR" \
		--libexecdir="$BINDIR" \
		--mandir="$PREFIX/share/man" \
		--disable-shared \
		--disable-manual \
		--disable-ntlm-wb \
		--disable-pop3 \
		--disable-imap \
		--disable-ldap \
		--disable-ldaps \
		--disable-telnet \
		--disable-smtp \
		--disable-rtsp \
		--without-nss \
		--without-libssh2 \
		--with-ssl=${openssl_libdir} \
		--enable-cares=${cares_libdir} \
		--with-zlib=${zlib_libdir} \
		--enable-static \
		--enable-ipv6
	make -j$nprocs
	# remake static, see: http://curl.haxx.se/mail/archive-2003-03/0115.html
	rm -f src/curl
	make LDFLAGS="-all-static $LDFLAGS"
	# install in ./lib for use as a dependency.
	make install LDFLAGS="-all-static $LDFLAGS" DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find "`pwd`" -iname "*.la" -exec rm {} \;
