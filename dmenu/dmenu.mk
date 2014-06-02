TARG = dmenu
DEPS = xorglibx11 xorgxproto xorglibxinerama xorgxineramaproto xorglibxext \
	xorglibxcb xorglibxau xorglibxdmcp

<$mkbuild/mk.common-noinst

dmenu:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# overwrite default config.mk to allow overriding some variables.
	# TODO: use original X11INC, X11LIB override
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$PREFIX" DESTDIR="$ROOT" install
