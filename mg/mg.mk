TARG = mg
DEPS = ncurses
INSTALL_BIN = mg
INSTALL_MAN1 = mg.1

<$mkbuild/mk.common

mg:QV:
	export CFLAGS="$CFLAGS -I. -D_GNU_SOURCE -DFKEYS -DREGEX -DXKEYS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" make \
		PREFIX="$PREFIX"
		CFLAGS="$CFLAGS" \
		LDFLAGS="$LDFLAGS"
