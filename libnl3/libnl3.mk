TARG = libnl3

<$mkbuild/mk.common

libnl3:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--enable-shared=no \
		--enable-static=yes
	make -j$nprocs
