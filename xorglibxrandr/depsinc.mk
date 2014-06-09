<$xorglibxrandr_DEPDIR/v.mk

xorglibxrandr_includedir = ${xorglibxrandr_DEPDIR}/libXrandr-$v/lib/include
xorglibxrandr_libdir = ${xorglibxrandr_DEPDIR}/libXrandr-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxrandr_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxrandr_libdir} -lXrandr
