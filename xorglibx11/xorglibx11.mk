TARG = xorglibx11
DEPS = xorgxproto xorglibxcb xorgxcbproto xorgkbproto \
	xorginputproto xorgxf86bigfontproto xorgxtrans

<$mkbuild/mk.common-noinst

xorglibx11:QV:
	# fix makekeys Makefile to use host cc
	# build makekeys staticly.
	cp ../makekeys_Makefile src/util/Makefile.in
	# set flags.
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# set these to make sure these are used.
	export BIGFONT_CFLAGS="-I${xorgxf86bigfontproto_includedir}"
	export BIGFONT_LIBS="-L${xorgxf86bigfontproto_libdir}"
	export X11_CFLAGS="${CFLAGS}"
	export X11_LIBS="${LDFLAGS}"
	./configure \
        --build="${TOOLCHAIN_TRIPLET}" \
        --host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--with-keysymdefdir="${xorgxproto_includedir}/X11" \
		--disable-shared \
		--enable-static
	# make and install.
	export HOSTCC_CFLAGS="-I${xorgxproto_includedir}"
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;

# /share/X11/locale/* etc
install:QV:
	export HOSTCC_CFLAGS="-I${xorgxproto_includedir}"
	make -j$nprocs install DESTDIR="$ROOT"
	rm -rf "$ROOT/lib"
	rm -rf "$ROOT/include"
	rm -rf "$ROOT/share/doc"
	rm -rf "$ROOT/share/man"
