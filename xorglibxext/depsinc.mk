<$xorglibxext_DEPDIR/v.mk

xorglibxext_includedir = ${xorglibxext_DEPDIR}/libXext-$v/lib/include
xorglibxext_libdir = ${xorglibxext_DEPDIR}/libXext-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibxext_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibxext_libdir} -lXext
