TARG = xorgxinit
DEPS = xorgxproto xorglibx11 xorglibxcb xorglibxau xorglibxdmcp

<$mkbuild/mk.common-noinst

xorgxinit:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export XINIT_CFLAGS="${CFLAGS}"
	export XINIT_LIBS="${LDFLAGS}"
	CC="$CC" ./configure \
		--prefix="$PREFIX"
	make -j$nprocs LIBS="-lX11 -lxcb -lXau -lXdmcp"

install:QV:
	make install DESTDIR="$ROOT"
