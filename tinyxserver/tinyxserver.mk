TARG = tinyxserver
DEPS = zlib tinyxlib

<$mkbuild/mk.common-noinst

tinyxserver:QV:
	case "$arch" in
	x86_64)
		EXTRA_CFLAGS="-D_XSERVER64=1 $CFLAGS"
		;;
	i486)
		EXTRA_CFLAGS="$CFLAGS"
		;;
	esac
	EXTRA_CFLAGS="$EXTRA_CFLAGS $DEPS_CFLAGS $DEPS_LDFLAGS"
	# fix typo in Makefile to use proper CFLAGS.
	cp ../Makefile Makefile
	make clean
	make -j$nprocs CC="$CC" EXTRA_CFLAGS="$EXTRA_CFLAGS" \
		FONTDIR="$PREFIX/share/fonts"

install:QV:
	make DESTDIR="$ROOT" BINDIR="/bin" install
	cd "$ROOT/$PREFIX/share/fonts/misc"
	mkfontscale
	mkfontdir
