TARG = quvi
DEPS = libquvi lua curl libressl zlib

<$mkbuild/mk.common-noinst

quvi:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS -lcrypto"
	export libquvi_CFLAGS="$CFLAGS"
	export libquvi_LIBS="$LDFLAGS"
	export libcurl_CFLAGS="$CFLAGS"
	export libcurl_LIBS="$LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
