# TODO: don't configure, just copy mkfontdir, it's just a single script file.
TARG = xorgmkfontdir

<$mkbuild/mk.common-noinst

xorgmkfontdir:QV:
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
