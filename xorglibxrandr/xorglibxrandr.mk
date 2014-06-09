TARG = xorglibxrandr
DEPS = xorgxproto xorglibx11 xorglibxrender xorgrenderproto xorglibxext xorgrandrproto

<$mkbuild/mk.common-noinst

xorglibxrandr:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export RANDR_CFLAGS="${CFLAGS}"
	export RANDR_LIBS="${LDFLAGS}"
	CC="$CC" CFLAGS="$CFLAGS -DHAVE__XEATDATAWORDS=1" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
