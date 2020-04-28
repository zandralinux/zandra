TARG = gcc
DEPS = gmp mpfr mpc zlib

<$mkbuild/mk.common-noinst

gcc:QV:
	export CFLAGS="${CFLAGS} ${DEPS_CFLAGS}"
	export LDFLAGS="-static ${LDFLAGS} ${DEPS_LDFLAGS}"
	./configure \
		--prefix="$PREFIX" \
		--libexecdir="$PREFIX/lib" \
		--disable-multilib \
		--disable-nls \
		--disable-werror \
		--disable-bootstrap \
		--disable-libsanitizer \
		--disable-libssp \
		--disable-symvers \
	    --disable-rpath \
		--enable-threads=posix \
		--enable-languages=c,c++ \
		--host=$arch-linux-musl \
		--target=$arch-linux-musl \
		--with-gmp=$gmp_includedir/.. \
		--with-mpc=$mpc_includedir/.. \
		--with-mpfr=$mpfr_includedir/..
	make -j$nprocs all-gcc
	make -j$nprocs all-target-libgcc
	make DESTDIR="lib" install-target-libgcc

install:QV:
	make DESTDIR="$ROOT" install-gcc
	make DESTDIR="$ROOT" install-target-libgcc
