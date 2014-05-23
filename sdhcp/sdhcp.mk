BIN = sdhcp
OBJ = sdhcp.o
LIB = util.a
LOBJ = `{ls util/*.c | sed 's/.$/o/'}
INSTALL_BIN = sdhcp
INSTALL_MAN1 = sdhcp.1

<$mkbuild/mk.common

&:n: &.o $LIB

$LIB: $LOBJ
