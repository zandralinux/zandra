TARG = htop
DEPS = ncurses

INSTALL_BIN = htop
INSTALL_MAN1 = htop.1

<$mkbuild/mk.common

htop:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-unicode \
		--enable-cgroup \
		--enable-oom
	make -j$nprocs LDFLAGS="-all-static $LDFLAGS"
