TARG = libass
DEPS = fontconfig expat freetype libpng zlib libfribidi

<$mkbuild/mk.common-noinst

libass:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export LIBPNG_CFLAGS="${libpng_CFLAGS}"
	export LIBPNG_LIBS="${libpng_LDFLAGS}"
	export FREETYPE_CFLAGS="${freetype_CFLAGS}"
	export FREETYPE_LIBS="${freetype_LDFLAGS}"
	export FRIBIDI_CFLAGS="${libfribidi_CFLAGS}"
	export FRIBIDI_LIBS="${libfribidi_LDFLAGS}"
	#
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-enca \
		--disable-test \
		--disable-harfbuzz \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
