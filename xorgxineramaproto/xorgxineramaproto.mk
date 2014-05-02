TARG = xorgxextproto

<$mkbuild/mk.common-noinst

xorgxextproto:QV:
	./configure --prefix="$prefix" \
	   --mandir="$ROOT/share/man"
	make -j$nprocs install DESTDIR="`pwd`/lib"
