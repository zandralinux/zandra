TARG = pkgtools
DEPS = libarchive zlib

<$mkbuild/mk.common-noinst

pkgtools:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	make -j$nprocs CC="${CC} -static" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
		PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs install CC="${CC} -static" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
		PREFIX="$PREFIX" DESTDIR="$ROOT"
