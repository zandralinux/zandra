TARG = xorgbigreqsproto

<$mkbuild/mk.common-noinst

xorgbigreqsproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
