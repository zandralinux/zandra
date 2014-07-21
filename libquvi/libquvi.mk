TARG = libquvi
DEPS = lua curl

<$mkbuild/mk.common-noinst

libquvi:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export liblua_CFLAGS="${lua_CFLAGS}"
	export liblua_LIBS="${lua_LDFLAGS}"
	export libcurl_CFLAGS="${curl_CFLAGS}"
	export libcurl_LIBS="${curl_LDFLAGS}"
	export libquvi_scripts_CFLAGS=" "
	export libquvi_scripts_LIBS=" "
	#
	sed -i -E 's@^(scriptsdir=).*@\1/share/libquvi-scripts@g' configure
	sed -i -E 's@^(versionfile=).*@\1/share/libquvi-scripts/version@g' configure
	sed -i -E 's@^(scriptsmodver=).*@\1@g' configure
	#
	CC="$CC" ./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs
	# install lib for use as a dependency.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
