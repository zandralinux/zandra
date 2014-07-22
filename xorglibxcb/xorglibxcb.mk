# make deps: python2.7 (with python 3 won't work atm (2014-04-30)).
#            xcbgen: python-xcbgen (debian), xorg-xcb-proto (crux).
TARG = xorglibxcb
DEPS = xorgxcbproto xorgxproto xorglibxau xorglibxdmcp

<$mkbuild/mk.common-noinst

xorglibxcb:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export PYTHON="python2.7"
	export XCBPROTO_CFLAGS="-I${xorgxcbproto_includedir}"
	export XCBPROTO_LIBS="-L${xorgxcbproto_libdir}"
	export XDMCP_CFLAGS="-I${xorglibxdmcp_includedir}"
	export XDMCP_LIBS="-L${xorglibxdmcp_libdir}"
	export NEEDED_CFLAGS="${CFLAGS}"
	export NEEDED_LIBS="${LDFLAGS}"
	# TODO: better flags.
#	export NEEDED_CFLAGS="-I${xorgxproto_includedir}"
#	export NEEDED_LIBS="-L${xorgxproto_libdir}"
	./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install XCBPROTO_XCBINCLUDEDIR="${xorgxcbproto_includedir}" \
		XCBPROTO_XCBPYTHONDIR="${xorgxcbproto_pythonlibdir}" \
		DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
