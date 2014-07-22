# TODO:
# - enable sndio, alsa, sdl2?
# - enable support for more libs (DVD etc).
# - ffmpeg ?
# make deps: python2.7?, perl
TARG = mpv
INSTALL_BIN = mpv
DEPS = xorglibxv xorglibxinerama xorglibx11 xorglibxcb xorglibxext xorglibxau \
	xorglibxdmcp xorgprotoall libav alsalib \
	libass fontconfig expat freetype libpng zlib libfribidi

<$mkbuild/mk.common

mpv:QV:
	export CFLAGS="-std=c99 $CFLAGS -I`pwd` -I`pwd`/old_build $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	#
	mkdir -p old_build
	cp ../config.h old_build/config.h
	cp ../config.mak old_build/config.mak
	cp old-makefile Makefile
	make -j$nprocs \
		CC="$CC" \
		LD="$LD" \
		LDFLAGS="$LDFLAGS" \
		CFLAGS="$CFLAGS" \
		EXTRALIBS="$LDFLAGS" \
		V="1"
