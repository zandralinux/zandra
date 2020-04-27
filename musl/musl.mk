TARG = musl

<$mkbuild/mk.common-noinst

musl:QV:
	cp ../config.mak .
	CC="" AR="" RANLIB="" make -j$nprocs

install:QV:
	make DESTDIR="$ROOT" install
