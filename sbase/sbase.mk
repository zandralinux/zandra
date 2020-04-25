TARG = sbase

<$mkbuild/mk.common-noinst

sbase:QV:
	cp -f ../config.mk config.mk
	make -j$nprocs DESTDIR="$ROOT"

install:QV:
	make -j$nprocs DESTDIR="$ROOT" install
