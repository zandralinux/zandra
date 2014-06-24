TARG = pkgtools
DEPS = libarchive zlib

<$mkbuild/mk.common-noinst
<../v.mk

pkgtools:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS -DVERSION=\\\"$v\\\" -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	make -j$nprocs CC="${CC} -static" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
		PREFIX="$PREFIX"

install:QV:
	make -j$nprocs install CC="${CC} -static" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" \
		PREFIX="$PREFIX" DESTDIR="$ROOT"
