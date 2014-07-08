TARG = ed

INSTALL_BIN = ed red
INSTALL_MAN1 = doc/ed.1

<$mkbuild/mk.common

ed:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
