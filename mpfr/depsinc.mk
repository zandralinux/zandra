<$mpfr_DEPDIR/v.mk

mpfr_includedir = $mpfr_DEPDIR/mpfr-$v/lib/include
mpfr_libdir = $mpfr_DEPDIR/mpfr-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I$mpfr_DEPDIR/mpfr-$v/lib/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$mpfr_DEPDIR/mpfr-$v/lib/lib
