<$gmp_DEPDIR/v.mk

gmp_includedir = $gmp_DEPDIR/gmp-$v/lib/include
gmp_libdir = $gmp_DEPDIR/gmp-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I$gmp_DEPDIR/gmp-$v/lib/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$gmp_DEPDIR/gmp-$v/lib/lib
