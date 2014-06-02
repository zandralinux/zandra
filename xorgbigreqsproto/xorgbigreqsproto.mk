TARG = xorgbigreqsproto

<$mkbuild/mk.common-noinst

xorgbigreqsproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
