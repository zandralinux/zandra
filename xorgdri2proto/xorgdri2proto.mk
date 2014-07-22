TARG = xorgdri2proto

<$mkbuild/mk.common-noinst

xorgdri2proto:QV:
    ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
        --prefix="$PREFIX" \
        --mandir="$ROOT/share/man"
    make -j$nprocs
    make install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
