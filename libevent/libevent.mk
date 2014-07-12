TARG = libevent

<$mkbuild/mk.common

libevent:QV:
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-libevent-regress \
		--enable-static
	make -j$nprocs
	# copy some header files to include dir for depsinc
	cp evdns.h event.h evhttp.h evrpc.h evutil.h include/
