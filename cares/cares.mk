TARG = cares

<$mkbuild/mk.common-noinst

$TARG:QV:
	export CPPFLAGS="-D_BSD_SOURCE -D_GNU_SOURCE"
	CC="${CC} -static" CFLAGS="" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${TOOLCHAIN_TRIPLET}" \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-werror \
		--disable-shared \
		--enable-static
	make -j$nprocs
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
