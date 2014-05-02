<$xorglibxau_DEPDIR/v.mk

xorglibxau_includedir = ${xorglibxau_DEPDIR}/libXau-$v/lib/include
xorglibxau_libdir = ${xorglibxau_DEPDIR}/libXau-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxau_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxau_libdir} -lXau
