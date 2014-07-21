TARG = libsigcpp

<$mkbuild/mk.common-noinst

libsigcpp:QV:
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-documentation \
		--enable-static
	# make install for use as a dependency.
	make -j$nprocs DESTDIR=`pwd`/lib install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
