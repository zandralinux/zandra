TARG = xorglibxau
DEPS = xorgxproto

<$mkbuild/mk.common-noinst

xorglibxau:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man"
	make -j$nprocs DESTDIR="`pwd`/lib/" install
