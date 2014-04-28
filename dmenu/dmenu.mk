TARG = dmenu
DEPS = tinyxlib

<$mkbuild/mk.common-noinst

dmenu:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT" install
