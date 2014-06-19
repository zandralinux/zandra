TARG = pcre
DEPS = zlib

<$mkbuild/mk.common-noinst

pcre:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-cpp \
		--disable-shared \
		--enable-static \
		--enable-unicode-properties \
		--enable-pcregrep-libz \
		--enable-utf
	make -j$nprocs
