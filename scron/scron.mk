TARG = scron

<$mkbuild/mk.common-noinst

scron:QV:
	make CC="$CC" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"

install:QV:
	make PREFIX="$PREFIX" DESTDIR="$ROOT" install
