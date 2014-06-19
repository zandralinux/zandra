TARG = libid3tag
DEPS = zlib

<$mkbuild/mk.common-noinst

libid3tag:QV:
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
