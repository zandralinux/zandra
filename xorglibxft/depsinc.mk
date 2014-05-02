<$xorglibxft_DEPDIR/v.mk

xorglibxft_libdir = $xorglibxft_DEPDIR/libXft-$v/lib/lib
xorglibxft_includedir = $xorglibxft_DEPDIR/libXft-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxft_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxft_libdir} -lXft
