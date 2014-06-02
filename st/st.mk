# make deps: tic (from ncurses).
TARG = st
DEPS = \
	fontconfig xorglibxft freetype expat xorglibxcb xorglibxext xorglibxrender \
	xorgrenderproto xorglibx11 xorgxtrans xorglibxcb xorgxcbproto xorgxproto \
	xorglibxau xorglibxdmcp libpng zlib

<$mkbuild/mk.common-noinst

st:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	# overwrite default config.mk to allow overriding some variables.
	cp ../config.mk config.mk
	CC="${CC} -static" make -j$nprocs \
		PREFIX="$PREFIX" DESTDIR="$ROOT"

install:QV:
	# NOTE: set TERMINFO to force the proper path.
	make -j$nprocs install PREFIX="$PREFIX" DESTDIR="$ROOT" \
		TERMINFO="$ROOT/share/terminfo"
