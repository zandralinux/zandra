TARG = sed

INSTALL_BIN = sed/sed
INSTALL_MAN1 = doc/sed.1

<$mkbuild/mk.common

sed:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
