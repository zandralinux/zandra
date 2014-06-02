TARG = xorgscrnsaverproto

<$mkbuild/mk.common-noinst

xorgscrnsaverproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
