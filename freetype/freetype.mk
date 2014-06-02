TARG = freetype
DEPS = zlib libpng

<$mkbuild/mk.common-noinst

freetype:QV:
	# CCexe is set to build apinames for host (needed in build).
#	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
#	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export ZLIB_CFLAGS="-I${zlib_includedir}"
	export ZLIB_LIBS="-L${zlib_libdir} -lzlib"
	# needed because build system calls libpng-config.
	export LIBPNG_CFLAGS="-I${libpng_includedir}"
	export LIBPNG_LIBS="-L${libpng_libdir} -lpng16"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls \
		--enable-static \
		--with-zlib \
		--with-png
	make -j$nprocs CCexe="${HOSTCC}" # DESTDIR="`pwd`/lib"
	make -j$nprocs CCexe="${HOSTCC}" install DESTDIR="`pwd`/lib"
	# make symlink for includes, some packages depend on this (fontconfig).
	mkdir -p "`pwd`/lib/include/freetype2/config"
	ln -sf freetype2 "`pwd`/lib/include/freetype"
	# fontconfig needs this.
	ln -sf . "`pwd`/lib/include/freetype/freetype"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
