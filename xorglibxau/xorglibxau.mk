TARG = xorglibxau
DEPS = xorgxproto

<$mkbuild/mk.common-noinst

xorglibxau:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XAU_CFLAGS="-I${xorgxproto_includedir}"
	export XAU_LIBS="-L${xorgxproto_libdir}"
	CC="$CC" ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs DESTDIR="`pwd`/lib/" install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
