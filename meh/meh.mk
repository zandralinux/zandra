BIN = src/meh
DEPS = xorglibx11 xorglibxcb xorglibxdmcp xorglibxau xorglibxext \
	xorgprotoall libgiflib libjpegturbo libpng zlib
INSTALL_BIN = src/meh
INSTALL_MAN1 = doc/meh.1
src_meh_OBJ = `{ls -1 src/*.c | sed 's/.$/o/'}
src_meh_LDFLAGS =
LOCAL_CFLAGS =
LOCAL_LDFLAGS =
LOCAL_BIN_LDFLAGS =

<$mkbuild/mk.common

$src_meh_OBJ: prepare

prepare:V:
	# fix include.
	grep -q 'X11/Xlib.h' src/meh.h || \
		sed -i -E 's@^(#include <stdio.h>)@\1\n#include <X11/Xlib.h>@g' src/meh.h
