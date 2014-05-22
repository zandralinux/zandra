TARG = rsync

<$mkbuild/mk.common-noinst

$TARG:QV:
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
	   --disable-locale
	make -j$nprocs

install:QV:
	make install DESTDIR="$ROOT"
