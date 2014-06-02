TARG = xorgxtrans

<$mkbuild/mk.common-noinst

xorgxtrans:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
