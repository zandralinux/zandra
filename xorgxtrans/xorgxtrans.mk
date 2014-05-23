TARG = xorgxtrans

<$mkbuild/mk.common-noinst

xorgxtrans:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
