TARG = fontconfig
DEPS = expat freetype libpng zlib

<$mkbuild/mk.common-noinst

fontconfig:QV:
	# skip building tests.
	printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > test/Makefile.in
#	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
#	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	export EXPAT_CFLAGS="-I${expat_includedir}"
	export EXPAT_LIBS="-L${expat_libdir} -lexpat"
	export FREETYPE_CFLAGS="-I${freetype_includedir}/"
	export FREETYPE_LIBS="-lfreetype -L${freetype_libdir}"
	CC="${CC} -static" ./configure \
		--prefix="$prefix" \
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
	# build these ourselves later.
	for f in fc-cache fc-cat fc-list fc-match fc-pattern fc-query fc-scan fc-validate; do
		printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > "$f/Makefile"
	done
	# make and install.
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# build and link tools manually.
	mkdir -p "`pwd`/lib/bin"
	for f in fc-cache fc-cat fc-list fc-match fc-pattern fc-query fc-scan fc-validate; do
		${CC} "$f/$f.c" -o "$f/$f" -Lsrc/.libs/ -I. -lfontconfig \
			${CFLAGS} ${LDFLAGS} ${DEPS_CFLAGS} ${DEPS_LDFLAGS}
		cp "$f/$f" "`pwd`/lib/bin/" && echo "$f"
	done
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

install:QV:
	# TODO: better way to install.
	mkdir -p "$ROOT"
	for d in bin etc var; do
		cp -a "`pwd`/lib/$d" "$ROOT/$d"
	done
