<$xorglibxfont_DEPDIR/v.mk

xorglibxfont_libdir = $xorglibxfont_DEPDIR/libXfont-$v/lib/lib
xorglibxfont_includedir = $xorglibxfont_DEPDIR/libXfont-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxfont_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxfont_libdir} -lXfont
