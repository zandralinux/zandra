# Description: Pixel manipulation library
# Deps: libpng
# Indirect deps: zlib (libpng).
TARG = xorglibpixman
DEPS = zlib libpng

<$mkbuild/mk.common-noinst

xorglibpixman:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export PNG_CFLAGS="-I${libpng_includedir}"
	export PNG_LIBS="-L${libpng_libdir} -lpng16 -lm -lz"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--enable-libpng
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
