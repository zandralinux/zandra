TARG = gawk

INSTALL_BIN = gawk
INSTALL_MAN1 = doc/gawk.1

<$mkbuild/mk.common

gawk:QV:
	CC="${CC} -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared
	make -j$nprocs
