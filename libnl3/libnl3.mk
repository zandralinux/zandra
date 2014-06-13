TARG = libnl3

<$mkbuild/mk.common

libnl3:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs
