<$xorglibxrender_DEPDIR/v.mk

xorglibxrender_libdir = $xorglibxrender_DEPDIR/libXrender-$v/lib/lib
xorglibxrender_includedir = $xorglibxrender_DEPDIR/libXrender-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxrender_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxrender_libdir} -lXrender
