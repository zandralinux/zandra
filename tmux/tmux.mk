TARG = tmux
DEPS = ncurses libevent
INSTALL_BIN = tmux
INSTALL_MAN1 = tmux.1

<$mkbuild/mk.common

tmux:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
	   --disable-shared \
	   --enable-static
	make -j$nprocs
