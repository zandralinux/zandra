BIN = sdhcp
OBJ = sdhcp.o
INSTALL_BIN = sdhcp
INSTALL_MAN1 = sdhcp.1

<$mkbuild/mk.common

sdhcp:QV:
	make -j$nprocs CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" PREFIX="$prefix" DESTDIR="$ROOT"
