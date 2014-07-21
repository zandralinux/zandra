TARG = diffutils

INSTALL_BIN = src/diff src/diff3 src/sdiff
INSTALL_MAN1 = man/diff.1 man/diff3.1 man/sdiff.1

<$mkbuild/mk.common

diffutils:QV:
	CC="${CC} -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-nls
	make -j$nprocs
