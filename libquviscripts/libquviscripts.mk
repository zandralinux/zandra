TARG = libquviscripts

<$mkbuild/mk.common-noinst

libquviscripts:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--without-manual \
		--with-nsfw
	make -j$nprocs

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
