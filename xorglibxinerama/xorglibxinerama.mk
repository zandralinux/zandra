TARG = xorglibxinerama
DEPS = xorglibx11 xorgxproto xorglibxext xorgxineramaproto xorglibxau

<$mkbuild/mk.common-noinst

xorglibxinerama:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# HAVE__XEATDATAWORDS is set, but it isn't detected with configure
	# set set it.
	CC="$CC" CFLAGS="$CFLAGS -DHAVE__XEATDATAWORDS=1" ./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs DESTDIR="`pwd`/lib/" install
