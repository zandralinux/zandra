TARG = ii

<$mkbuild/mk.common-noinst

ii:QV:
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT"

install:QV:
	make -j$nprocs PREFIX="$prefix" DESTDIR="$ROOT" install
