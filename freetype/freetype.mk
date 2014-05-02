TARG = freetype

<$mkbuild/mk.common-noinst

freetype:QV:
	# build apinames for host (needed in build).
	# TODO: possibly use CCraw="cc" CCexe="cc" CCexe_CFLAGS=""
	#       couldn't get that to work though.
	#CC="cc" CFLAGS="" LDFLAGS="" make src/tools/apinames
	cp ../fix_exports.mk builds/exports.mk
	#
	CC="$CC" ./configure --prefix="$prefix" --mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		--with-zlib
	make -j$nprocs install DESTDIR="`pwd`/lib"
	# make symlink for includes, some packages depend on this (fontconfig).
	ln -sf freetype2/freetype "`pwd`/lib/include/freetype"
	# remove .la files for now ?
	find `pwd`/lib -iname "*.la" -exec rm {} \;
