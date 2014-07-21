TARG = elinks
DEPS = zlib bzip2 libressl

<$mkbuild/mk.common-noinst

elinks:QV:
	# TODO: enable TRE search? (--with-tre).
	# fix VA_COPY, __va_copy is va_copy.
	export CFLAGS="$CFLAGS $DEPS_CFLAGS -DVA_COPY=va_copy"
	export CPPFLAGS="$CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls \
		--disable-bittorrent \
		--disable-cgi \
		--disable-finger \
		--disable-smb \
		--disable-nntp \
		--without-ruby \
		--without-perl \
		--without-lua \
		--without-gnutls \
		--without-tre \
		--with-openssl \
		--with-zlib \
		--with-bzlib \
		--enable-mouse \
		--enable-gopher \
		--enable-ipv6 \
		--enable-mailcap \
		--enable-256-colors \
		--enable-static
	# fix warnings: sys/signal.h -> signal.h
	find . -type f -name "*.[ch]" -exec sed 's@sys/signal.h@signal.h@g' -i {} \;
	# NOTES:
	# - LD is set to "ld", not gcc, because Makefile.lib specifies:
	#   ld -r -o ...
	# use $TOOLCHAIN-ld ($LD can be set to $CC).
	printf '%s' "$LD" | grep -q 'ld' || export LD="`$CC -dumpmachine`-ld"
	# - X_CFLAGS is set to blank, it's set to "-I/usr/include" which breaks
	#   builds outside emul.
	make -j$nprocs \
		V="1" CC="${CC} -static" \
		X_CFLAGS=" " \
		LD="$LD" \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"

install:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS -DVA_COPY=va_copy"
	export CPPFLAGS="$CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# use $TOOLCHAIN-ld ($LD can be set to $CC).
	printf '%s' "$LD" | grep -q 'ld' || export LD="`$CC -dumpmachine`-ld"
	make -j$nprocs install DESTDIR="$ROOT" \
		V="1" CC="${CC} -static" \
		X_CFLAGS=" " \
		LD="$LD" \
		CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
