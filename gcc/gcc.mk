TARG = gcc
DEPS = gmp mpfr mpc

<$mkbuild/mk.common-noinst

gcc:QV:
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-multilib \
		--disable-nls \
		--disable-bootstrap \
		--enable-languages=c,c++ \
		--host=$arch-linux-musl \
		--target=$arch-linux-musl \
		--with-gmp=$gmp_includedir/.. \
		--with-mpc=$mpc_includedir/.. \
		--with-mpfr=$mpfr_includedir/..
	make -j$nprocs all-gcc

install:QV:
	make DESTDIR="$ROOT" install-gcc