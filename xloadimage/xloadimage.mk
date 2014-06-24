TARG = xloadimage
DEPS = xorglibxcb xorglibx11 xorglibxau xorglibxdmcp xorgxproto

INSTALL_BIN = \
	xloadimage \
	uufilter

INSTALL_MAN1 = xloadimage.1 uufilter.1
INSTALL_SYMLINK = \
	xloadimage /bin/xsetbg

<$mkbuild/mk.common

xloadimage:QV:
	find -name "*.[ch]" -exec sed 's@<varargs.h>@<stdarg.h>@g' -i {} \;
	#
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	make -j$nprocs \
		CONFIG_STYLE="-skip" \
		CC="${CC}" \
		CC_FLAGS="$CFLAGS" \
		SYS_LIBS="$LDFLAGS" \
		AR="${AR}" \
		RANLIB="${RANLIB}"
	# proper filename.
	cp xloadimage.man xloadimage.1
	cp uufilter.man uufilter.1
