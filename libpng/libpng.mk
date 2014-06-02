TARG = libpng
DEPS = zlib

<$mkbuild/mk.common-noinst

libpng:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export CPPFLAGS="${CFLAGS}"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	# make and install.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
