<$gmp_DEPDIR/v.mk

gmp_libdir = $gmp_DEPDIR/gmp-$v/lib/lib
gmp_includedir = $gmp_DEPDIR/gmp-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${gmp_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${gmp_libdir}
