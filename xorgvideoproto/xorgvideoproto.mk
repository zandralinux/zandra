TARG = xorgvideoproto

<$mkbuild/mk.common-noinst

xorgvideoproto:QV:
    ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
        --prefix="$PREFIX" \
        --mandir="$ROOT/share/man"
    make -j$nprocs
    make install DESTDIR="`pwd`/lib"
