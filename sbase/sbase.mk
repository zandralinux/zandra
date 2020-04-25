TARG = sbase

<$mkbuild/mk.common-noinst

sbase:QV:
	CC="${CC} -static" make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
