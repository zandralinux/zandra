TARG = mupdf
DEPS = openssl xorglibx11 xorglibxext xorgxproto xorgxextproto \
	xorglibxcb xorgxcbproto xorglibxau xorglibxdmcp

<$mkbuild/mk.common-noinst

mupdf:QV:
	# default build was "debug", use "release".
	build="release"
	# fix for Makerules: hardcoded (X11) paths etc.
	cp ../Makerules Makerules
	# build tools used in build
	# (CROSSCOMPILE="yes" disables these in the  normal build).
	mkdir -p generated build/${build}
	for tool in bin2hex cmapdump cquote fontdump; do
		CC="${HOSTCC}" CFLAGS="" LDFLAGS="" make scripts/${tool}
		cp "scripts/${tool}" "build/${build}"
	done
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# TODO: disable hardcoded X11 include paths etc in Makefile?
	# TODO: change X11_LIBS etc. depending on DEPS, don't hardcode them.
	make -j$nprocs \
		build="${build}" \
		prefix="$PREFIX" \
		verbose="yes" \
		CROSSCOMPILE="yes" \
		HAVE_X11="yes" \
		HAVE_CURL="no" \
		X11_CFLAGS="${CFLAGS}" \
		X11_LIBS="${LDFLAGS}" \
		OPENSSL_CFLAGS="-DHAVE_OPENSSL -I${openssl_includedir} -L${openssl_libdir}" \
		OPENSSL_LIBS="-lcrypto -lssl"

install:QV:
	build="release"
	make -j$nprocs install \
		DESTDIR="$ROOT" \
		build="${build}" \
		prefix="$PREFIX" \
		verbose="yes" \
		CROSSCOMPILE="yes" \
		HAVE_X11="yes" \
		HAVE_CURL="no" \
		X11_CFLAGS="-I${xorglibx11_includedir} -I${xorglibxext_includedir} -L${xorglibx11_libdir} -L${xorglibxext_libdir}" \
		X11_LIBS="-lX11 -lX11-xcb -lXext -lxcb -lXau" \
		OPENSSL_CFLAGS="-DHAVE_OPENSSL -I${openssl_includedir} -L${openssl_libdir}" \
		OPENSSL_LIBS="-lcrypto -lssl"
