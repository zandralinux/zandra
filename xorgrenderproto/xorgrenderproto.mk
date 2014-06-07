TARG = xorgrenderproto

<$mkbuild/mk.common-noinst

xorgrenderproto:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man"
	make -j$nprocs install DESTDIR="`pwd`/lib"
