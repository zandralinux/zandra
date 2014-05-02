TARG = xorglibxrender
DEPS = xorglibx11 xorgxproto xorgrenderproto

<$mkbuild/mk.common-noinst

xorglibxrender:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# HAVE__XEATDATAWORDS is set, but it isn't detected with configure
	# set set it.
	CC="$CC" CFLAGS="$CFLAGS -DHAVE__XEATDATAWORDS=1" ./configure \
		--prefix="$prefix" --mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
