TARG = xorgxf86bigfontproto

<$mkbuild/mk.common-noinst

$TARG:QV:
	./configure --prefix="$prefix" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs install DESTDIR="`pwd`/lib"
