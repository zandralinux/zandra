TARG = rsync

<$mkbuild/mk.common-noinst

rsync:QV:
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-locale
	make -j$nprocs

install:QV:
	make install DESTDIR="$ROOT"
