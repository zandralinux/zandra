BIN = sandy
OBJ = sandy.o
INSTALL_BIN = sandy
INSTALL_MAN1 = `{ls *.1}
NPROC = $nprocs
DEPS = ncurses

<$mkbuild/mk.common
<../v.mk

LOCAL_CFLAGS = -DVERSION=\"$v\" ${ncurses_cflags}
LOCAL_LDFLAGS = ${ncurses_ldflags} -lncurses
sandy_LDFLAGS =
LOCAL_BIN_LDFLAGS =

&:n: &.o
