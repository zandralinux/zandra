TARG = ubase

<$mkbuild/mk.common-noinst

ubase:QV:
	cp ../config.mk config.mk
	make -j$nprocs DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
