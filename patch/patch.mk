TARG = patch

INSTALL_BIN = src/patch

<$mkbuild/mk.common

patch:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
