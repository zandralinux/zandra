TARG = xorglibxft
DEPS = xorglibx11 xorgxproto freetype fontconfig xorglibxrender xorgrenderproto

<$mkbuild/mk.common-noinst

xorglibxft:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install DESTDIR="`pwd`/lib"
