TARG = dwm
DEPS = tinyxlib

<$mkbuild/mk.common-noinst

dwm:QV:
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="${CC} -static" make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT" install
