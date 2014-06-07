TARG = expat

<$mkbuild/mk.common-noinst

expat:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	# make and install.
	make -j$nprocs install \
		LDFLAGS="-all-static $LDFLAGS" DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install \
		LDFLAGS="-all-static $LDFLAGS" DESTDIR="$ROOT"
