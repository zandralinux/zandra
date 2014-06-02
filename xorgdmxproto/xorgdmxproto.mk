TARG = xorgdmxproto

<$mkbuild/mk.common-noinst

xorgdmxproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs
	make install DESTDIR="`pwd`/lib"
