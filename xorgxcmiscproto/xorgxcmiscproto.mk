TARG = xorgxcmiscproto

<$mkbuild/mk.common-noinst

xorgxcmiscproto:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
