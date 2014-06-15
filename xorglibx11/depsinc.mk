<$xorglibx11_DEPDIR/v.mk

xorglibx11_libdir = $xorglibx11_DEPDIR/libX11-$v/lib/lib
xorglibx11_includedir = $xorglibx11_DEPDIR/libX11-$v/lib/include

xorglibx11_CFLAGS = -I${xorglibx11_includedir}
xorglibx11_LDFLAGS = -L${xorglibx11_libdir} -lX11

DEPS_CFLAGS = $DEPS_CFLAGS ${xorglibx11_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${xorglibx11_LDFLAGS}
