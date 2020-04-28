TARG = gcc
DEPS = gmp mpfr mpc

<$mkbuild/mk.common-noinst

gcc:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
		--exec-prefix="$PREFIX" \
		--libexecdir="$PREFIX/lib" \
		--disable-shared \
		--disable-multilib \
		--disable-nls \
		--disable-bootstrap \
		--enable-languages=c,c++ \
		--host=$arch-linux-musl \
		--target=$arch-linux-musl
	make -j$nprocs all-gcc

install:QV:
	make DESTDIR="$ROOT" install-gcc