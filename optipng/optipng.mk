TARG = optipng
DEPS = libpng zlib

<$mkbuild/mk.common-noinst

optipng:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		-prefix="$PREFIX" \
		-mandir="$ROOT/share/man" \
		-with-system-libs \
		-with-system-libpng \
		-with-system-zlib
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
