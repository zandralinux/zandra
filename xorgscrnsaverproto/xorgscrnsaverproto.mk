TARG = xorgscrnsaverproto

<$mkbuild/mk.common-noinst

xorgscrnsaverproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
