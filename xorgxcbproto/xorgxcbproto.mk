# make deps: python2.7, xmllint (libxml2).
TARG = xorgxcbproto

<$mkbuild/mk.common-noinst

xorgxcbproto:QV:
	export PYTHON="python2.7"
    ./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
        --prefix="$PREFIX" \
        --mandir="$ROOT/share/man"
    make -j$nprocs
    make install DESTDIR="`pwd`/lib"
