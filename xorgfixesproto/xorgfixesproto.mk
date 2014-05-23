TARG = xorgfixesproto

<$mkbuild/mk.common-noinst

xorgfixesproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
