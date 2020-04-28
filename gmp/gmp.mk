TARG = gmp

<$mkbuild/mk.common-noinst

gmp:QV:
	./configure \
		--prefix="$PREFIX" \
		--build=x86_64-linux-musl \
		--host=x86_64-linux-musl \
		--enable-static \
		--disable-shared
	make -j$nprocs
	make DESTDIR=`pwd`/lib install
	rm lib/lib/libgmp.la

install:QV:
	make DESTDIR="$ROOT" install
