TARG = xorgdamageproto

<$mkbuild/mk.common-noinst

xorgdamageproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
