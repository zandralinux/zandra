TARG = `ls *.c | sed 's/\.c//'`

<$mkbuild/mk.common-noinst

$TARG:QV:
	cp -f ../config.mk config.mk
	make -j$nprocs DESTDIR="$ROOT"

install:QV:
	make -j$nprocs DESTDIR="$ROOT" install
