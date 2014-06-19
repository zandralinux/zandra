TARG = fontconfig
DEPS = expat freetype libpng zlib

<$mkbuild/mk.common

INSTALL_DIRS = \
	/var/cache/fontconfig

INSTALL_MAN1 = \
	fc-cache/fc-cache.1 \
	fc-cat/fc-cat.1 \
	fc-list/fc-list.1 \
	fc-match/fc-match.1 \
	fc-pattern/fc-pattern.1 \
	fc-query/fc-query.1 \
	fc-scan/fc-scan.1 \
	fc-validate/fc-validate.1

INSTALL_BIN = \
	lib/bin/fc-cache \
	lib/bin/fc-cat \
	lib/bin/fc-list \
	lib/bin/fc-match \
	lib/bin/fc-pattern \
	lib/bin/fc-query \
	lib/bin/fc-scan \
	lib/bin/fc-validate

installetc:
	$INSTALL -d -m 755 "$ROOT/etc"
	cp -a lib/etc/fonts "$ROOT/etc"
	chmod 755 "$ROOT/etc/fonts"
	chmod 755 "$ROOT/etc/fonts/conf.d"
	chmod 755 "$ROOT/etc/fonts/conf.avail"

install: installetc

fontconfig:QV:
	# skip building tests.
	printf "all:\n\ttrue\n\ninstall:\n\ttrue\n\n" > test/Makefile.in
	export EXPAT_CFLAGS="${expat_CFLAGS}"
	export EXPAT_LIBS="${expat_LDFLAGS}"
	export FREETYPE_CFLAGS="${freetype_CFLAGS}"
	export FREETYPE_LIBS="${freetype_LDFLAGS}"
	CC="${CC} -static" ./configure \
		--prefix="$PREFIX" \
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
	# build these tools ourselves later.
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
		echo "Copy $f -> `pwd`/lib/bin/"
		$INSTALL -m 755 "$f/$f" "`pwd`/lib/bin/"
	done
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
