TARG = xorgrandrproto

<$mkbuild/mk.common-noinst

xorgrandrproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
