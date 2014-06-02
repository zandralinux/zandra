TARG = xorgrandrproto

<$mkbuild/mk.common-noinst

xorgrandrproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
