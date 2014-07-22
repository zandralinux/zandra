TARG = freetype
DEPS = zlib libpng

<$mkbuild/mk.common-noinst

freetype:QV:
	# CCexe is set to build apinames for host (needed in build).
	export ZLIB_CFLAGS="${zlib_CFLAGS}"
	export ZLIB_LIBS="${zlib_LDFLAGS}"
	export HARFBUZZ_CFLAGS=" "
	export HARFBUZZ_LDFLAGS=" "
	# needed because build system calls libpng-config.
	export LIBPNG_CFLAGS="${libpng_CFLAGS}"
	export LIBPNG_LIBS="${libpng_LDFLAGS}"
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--with-fsspec=no \
		--with-fsref=no \
		--with-bzip2=no \
		--with-ats=no \
		--with-quickdraw-toolbox=no \
		--with-quickdraw-carbon=no \
		--with-old-mac-fonts=no \
		--with-harfbuzz=no \
		--with-zlib=yes \
		--with-png=yes
	make -j$nprocs CCexe="${HOSTCC}"
	make -j$nprocs install CCexe="${HOSTCC}" DESTDIR="`pwd`/lib"
	# make symlink for includes, some packages depend on this (fontconfig).
	mkdir -p "`pwd`/lib/include/freetype2/config"
	ln -sf freetype2 "`pwd`/lib/include/freetype"
	# fontconfig needs this.
	ln -sf . "`pwd`/lib/include/freetype/freetype"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
