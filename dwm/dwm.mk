TARG = dwm
DEPS = xorglibx11 xorgxproto xorglibxinerama xorglibxext \
	xorglibxcb xorglibxau xorglibxdmcp

<$mkbuild/mk.common-noinst

dwm:QV:
	# overwrite default config.mk to allow overriding some variables.
	# TODO: use original X11INC, X11LIB override
	cp ../config.mk config.mk
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
