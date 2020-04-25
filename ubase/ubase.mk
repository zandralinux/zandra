TARG = `ls *.c | sed 's/\.c//'`

<$mkbuild/mk.common-noinst

$TARG:QV:
	CC="${CC} -static" make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
