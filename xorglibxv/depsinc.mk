<$xorglibxv_DEPDIR/v.mk

xorglibxv_bindir = ${xorglibxv_DEPDIR}/libXv-$v/lib/bin
xorglibxv_libdir = ${xorglibxv_DEPDIR}/libXv-$v/lib/lib
xorglibxv_includedir = ${xorglibxv_DEPDIR}/libXv-$v/lib/include

xorglibxv_CFLAGS = -I${xorglibxv_includedir}
xorglibxv_LDFLAGS = -L${xorglibxv_libdir} -lXv

DEPS_CFLAGS = $DEPS_CFLAGS ${xorglibxv_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${xorglibxv_LDFLAGS}
