TARG = xorgrecordproto

<$mkbuild/mk.common-noinst

xorgrecordproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
