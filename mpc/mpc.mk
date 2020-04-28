TARG = mpc
DEPS = mpfr gmp

<$mkbuild/mk.common-noinst

mpc:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	./configure \
		--prefix="$PREFIX" \
		--build=x86_64-linux-musl \
		--host=x86_64-linux-musl \
		--enable-static \
		--disable-shared \
		--with-mpfr=$mpfr_DEPDIR \
		--with-gmp=$gmp_DEPDIR
	make -j$nprocs
	make DESTDIR=`pwd`/lib install
	rm lib/lib/libmpc.la

install:QV:
	make DESTDIR="$ROOT" install
