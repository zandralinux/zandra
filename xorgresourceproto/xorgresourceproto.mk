TARG = xorgresourceproto

<$mkbuild/mk.common-noinst

xorgresourceproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
