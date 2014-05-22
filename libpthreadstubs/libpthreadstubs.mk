TARG = libpthreadstubs

<$mkbuild/mk.common-noinst

$TARG:QV:
	CC="$CC" ./configure \
		--prefix="$prefix" \
		--disable-shared \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
