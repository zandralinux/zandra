TARG = `ls *.c | sed 's/\.c//'`

<$mkbuild/mk.common-noinst

$TARG:QV:
	cp ../config.mk config.mk
	make -j$nprocs DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
