TARG = xorgfontsproto

<$mkbuild/mk.common-noinst

xorgfontsproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
