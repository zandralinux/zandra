TARG = curl
DEPS = zlib openssl cares
INSTALL_BIN = src/curl
INSTALL_MAN1 = \
	docs/curl.1 \
	docs/curl-config.1

<$mkbuild/mk.common

curl:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC -static" ./configure --prefix="" \
		--bindir="$BINDIR" --sbindir="$BINDIR" --libexecdir="$BINDIR" \
		--mandir="/share/man" \
		--disable-shared \
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
		--with-zlib \
		--enable-static \
		--enable-ipv6
	make -j$nprocs
	# remake static, see: http://curl.haxx.se/mail/archive-2003-03/0115.html
	rm -f src/curl
	make LDFLAGS="-all-static $LDFLAGS"
