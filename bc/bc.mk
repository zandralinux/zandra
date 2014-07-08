TARG = bc

INSTALL_BIN = bc/bc
INSTALL_MAN1 = doc/bc.1

<$mkbuild/mk.common

bc:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
