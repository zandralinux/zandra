TARG = xorglibxft
DEPS = xorglibx11 xorgxproto freetype fontconfig xorglibxrender xorgrenderproto

<$mkbuild/mk.common-noinst

xorglibxft:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	#export XRENDER_CFLAGS="-I${xorglibxrender_includedir}"
	#export XRENDER_LIBS="-lX11 -lXrender -lxcb -lXau -lXdmcp -L${xorglibxrender_libdir}"
	export XRENDER_CFLAGS="${CFLAGS}"
	export XRENDER_LIBS="${LDFLAGS}"
	# include dir is "freetype" not "freetype2".
	export FREETYPE_CFLAGS="-I${freetype_includedir}../"
#	export FREETYPE_LIBS="-lfreetype -L${freetype_libdir}"
	export FREETYPE_LIBS="${LDFLAGS}"
	export FONTCONFIG_CFLAGS="${CFLAGS}"
	export FONTCONFIG_LIBS="${LDFLAGS}"
	#export FONTCONFIG_CFLAGS="-I${fontconfig_includedir}"
	#export FONTCONFIG_LIBS="-lfontconfig -L${fontconfig_libdir}"
	CC="$CC" ./configure  \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
