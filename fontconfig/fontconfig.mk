TARG = fontconfig
DEPS = expat freetype

<$mkbuild/mk.common-noinst

fontconfig:QV:
	# skip building tests.
	printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > test/Makefile.in
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
#	export PKG_CONFIG="/bin/true"
	./configure --prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--with-xmldir=/etc/fonts \
		--with-templatedir=/etc/fonts/conf.avail \
		--with-expat-includes="${expat_includedir}" \
		--with-expat-lib="${expat_libdir}" \
		--disable-docs \
		--disable-shared \
		--enable-static
	# make and install.
	make -j$nprocs install \
		FREETYPE_LIBS="-lfreetype -L${freetype_libdir}" FREETYPE_CFLAGS="-I${freetype_includedir}" \
		DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
