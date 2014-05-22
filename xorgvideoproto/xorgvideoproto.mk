TARG = xorgvideoproto

<$mkbuild/mk.common-noinst

$TARG:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
