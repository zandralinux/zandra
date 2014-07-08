TARG = bison

INSTALL_BIN = src/bison src/yacc
INSTALL_MAN1 = doc/bison.1 doc/yacc.1

<$mkbuild/mk.common

bison:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
