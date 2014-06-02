TARG = xorgxcmiscproto

<$mkbuild/mk.common-noinst

xorgxcmiscproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
