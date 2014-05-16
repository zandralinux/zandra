TARG = xorgxf86bigfontproto

<$mkbuild/mk.common-noinst

xorgxf86bigfontproto:QV:
	./configure --prefix="$prefix" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs install DESTDIR="`pwd`/lib"
