TARG = xorglibx11
DEPS = xorgxproto xorgxtrans xorglibxcb xorgkbproto xorginputproto

<$mkbuild/mk.common-noinst

xorglibx11:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	./configure --prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-loadable-xcursor \
		--disable-shared \
		--enable-static
	# fix makekeys Makefile to use host cc
	# build makekeys staticly.
	cp ../makekeys_Makefile src/util/Makefile
	# make and install.
	make -j$nprocs install DESTDIR=`pwd`/lib
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
