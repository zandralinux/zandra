TARG = xorglibdrm
DEPS = libpthreadstubs xorglibpciaccess

<$mkbuild/mk.common-noinst

xorglibdrm:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export PTHREADSTUBS_CFLAGS="${CFLAGS}"
	export PTHREADSTUBS_LIBS="${LDFLAGS}"
	export PCIACCESS_CFLAGS="${CFLAGS}"
	export PCIACCESS_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-nouveau \
		--disable-vmwgfx \
		--disable-shared \
		--enable-static
	make -j$nprocs
	make -j$nprocs install DESTDIR=`pwd`/lib
	find `pwd`/lib -iname "*.la" -exec rm {} \;
