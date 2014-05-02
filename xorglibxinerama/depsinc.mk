<$xorglibxinerama_DEPDIR/v.mk

xorglibxinerama_includedir = ${xorglibxinerama_DEPDIR}/libXinerama-$v/lib/include
xorglibxinerama_libdir = ${xorglibxinerama_DEPDIR}/libXinerama-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxinerama_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxinerama_libdir} -lXinerama
