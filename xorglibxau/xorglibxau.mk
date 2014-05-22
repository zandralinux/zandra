TARG = xorglibxau
DEPS = xorgxproto

<$mkbuild/mk.common-noinst

$TARG:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XAU_CFLAGS="-I${xorgxproto_includedir}"
	export XAU_LIBS="-L${xorgxproto_libdir}"
	CC="$CC" ./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
