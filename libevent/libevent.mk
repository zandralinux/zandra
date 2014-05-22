TARG = libevent

<$mkbuild/mk.common

$TARG:QV:
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
		 --disable-shared \
		--enable-static
	make -j$nprocs
	# copy some header files to include dir for depsinc
	cp evdns.h event.h evhttp.h evrpc.h evutil.h include/
