TARG = libjpegturbo

<$mkbuild/mk.common-noinst

libjpegturbo:QV:
	CC="${CC} -static" ./configure \
		 --prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--with-jpeg8 \
		--includedir="/include/libjpeg-turbo" \
		--libdir="/lib/libjpeg-turbo" \
		--without-simd \
		--program-suffix=-turbo
	# make and install.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
