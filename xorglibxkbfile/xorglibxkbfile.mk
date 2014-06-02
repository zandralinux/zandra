TARG = xorglibxkbfile
DEPS = xorgkbproto xorgxproto xorglibx11

<$mkbuild/mk.common-noinst

xorglibxkbfile:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XKBFILE_CFLAGS="-I${xorgkbproto_includedir}"
	export XKBFILE_LIBS="-L${xorgkbproto_libdir}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
