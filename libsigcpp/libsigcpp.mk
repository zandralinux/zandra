TARG = libsigcpp

<$mkbuild/mk.common-noinst

libsigcpp:QV:
#	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
#	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--disable-documentation \
		--enable-static
	# make install for use as a dependency.
	make -j$nprocs DESTDIR=`pwd`/lib install
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
