TARG = libav

<$mkbuild/mk.common-noinst

libav:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--target-os="linux" \
		--cross-prefix="`$CC -dumpmachine`-" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-doc \
		--disable-asm \
		--enable-static \
		--enable-cross-compile
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
