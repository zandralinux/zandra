TARG = ii

<$mkbuild/mk.common-noinst

$TARG:QV:
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs LDFLAGS="$LDFLAGS" \
		PREFIX="$prefix" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs LDFLAGS="$LDFLAGS" \
		PREFIX="$prefix" DESTDIR="$ROOT" install
