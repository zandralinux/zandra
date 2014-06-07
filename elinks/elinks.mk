TARG = elinks
DEPS = zlib bzip2 openssl

<$mkbuild/mk.common-noinst

elinks:QV:
	# TODO: enable TRE search? (--with-tre).
	# fix VA_COPY, __va_copy is va_copy.
	export CFLAGS="$CFLAGS $DEPS_CFLAGS -DVA_COPY=va_copy"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC -static" ./configure \
		--prefix="$prefix" \
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
	# NOTE: LD is set to "ld", not gcc, because Makefile.lib specifies:
	#       ld -r -o ...
	make -j$nprocs \
		V="1" CC="${CC} -static" \
		LD="${TOOLCHAIN_TRIPLET}-ld" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"

install:QV:
	make -j$nprocs install DESTDIR="$ROOT" \
		V="1" CC="${CC} -static" \
		LD="${TOOLCHAIN_TRIPLET}-ld" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
