<$ncurses_DEPDIR/v.mk

DEPS_CFLAGS = $DEPS_CFLAGS -I$ncurses_DEPDIR/ncurses-$v/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$ncurses_DEPDIR/ncurses-$v/lib
