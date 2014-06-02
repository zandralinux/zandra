TARG = tinyxlib

<$mkbuild/mk.common

tinyxlib:QV:
	make clean
	make -j$nprocs CC="$CC" BINDIR="/bin" LIBDIR="$PREFIX/lib" STATIC=1 \
		FONT_ENCODINGS_DIRECTORY="$PREFIX/share/fonts/encodings/encodings.dir"
	# make symlinks for libs, just link to libX11.a like make install does.
	for f in \
		libXdmcp.a \
		libXinerama.a \
		libXrender.a \
		libXcursor.a \
		libXpm.a \
		libXmuu.a \
		libSM.a \
		libXmu.a \
		libICE.a \
		libXss.a \
		libXv.a \
		libXfont.a \
		libXext.a \
		libXt.a \
		libXau.a \
		libXtst.a \
		libXfixes.a \
		libXi.a \
		libXaw.a; do
		ln -sf libX11.a $f
	done
#	make DESTDIR="$libcroot" BINDIR="/bin" LIBDIR="/lib" STATIC=1 install
