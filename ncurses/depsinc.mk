<$ncurses_DEPDIR/v.mk

ncurses_includedir = ${ncurses_DEPDIR}/ncurses-$v/include
ncurses_libdir = ${ncurses_DEPDIR}/ncurses-$v/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${ncurses_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${ncurses_libdir}
