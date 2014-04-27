TARG = ii
INSTALL_BIN = \
	ii
INSTALL_MAN1 = \
	ii.1

<$mkbuild/mk.common

ii:QV:
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT"
