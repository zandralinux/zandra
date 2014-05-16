TARG = xorgvideoproto

<$mkbuild/mk.common-noinst

xorgvideoproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
