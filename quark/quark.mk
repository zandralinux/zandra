TARG = quark

<$mkbuild/mk.common-noinst

quark:QV:
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
