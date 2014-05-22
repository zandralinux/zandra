TARG = expat

<$mkbuild/mk.common-noinst

$TARG:QV:
	# TODO: $ROOT/bin/xmlwf is not staticly linked.
	./configure --prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	# make and install.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
