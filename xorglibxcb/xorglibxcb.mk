# make deps: python2.7 (with python 3 won't work atm (2014-04-30)).
TARG = xorglibxcb
DEPS = xorgxcbproto xorglibxau xorgxproto

<$mkbuild/mk.common-noinst

xorglibxcb:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export PYTHON="python2.7"
	# stfu
	export PKG_CONFIG="/bin/true"
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install XCBPROTO_XCBINCLUDEDIR="${xorgxcbproto_includedir}" \
		XCBPROTO_XCBPYTHONDIR="${xorgxcbproto_pythonlibdir}" \
		DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
