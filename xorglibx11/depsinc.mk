<$xorglibx11_DEPDIR/v.mk

xorglibx11_libdir = $xorglibx11_DEPDIR/libX11-$v/lib/lib
xorglibx11_includedir = $xorglibx11_DEPDIR/libX11-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibx11_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibx11_libdir} -lX11 -lX11-xcb
