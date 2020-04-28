TARG = mpfr
DEPS = gmp

<$mkbuild/mk.common-noinst

mpfr:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	./configure \
		--prefix="$PREFIX" \
		--build=x86_64-linux-musl \
		--host=x86_64-linux-musl \
		--enable-static \
		--disable-shared
	make -j$nprocs
	make DESTDIR=`pwd`/lib install
	rm lib/lib/libmpfr.la

install:QV:
	make DESTDIR="$ROOT" install
