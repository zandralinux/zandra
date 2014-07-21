TARG = dropbear
DEPS = zlib
INSTALL_BIN = \
	dropbearkey \
	dropbearconvert \
	dbclient \
	dropbear
INSTALL_MAN1 = \
	dropbearkey.1 \
	dropbearconvert.1
INSTALL_MAN8 = dropbear.8

<$mkbuild/mk.common

dropbear:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
