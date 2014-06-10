<$libpng_DEPDIR/v.mk

libpng_libdir = ${libpng_DEPDIR}/libpng-$v
libpng_includedir = ${libpng_DEPDIR}/libpng-$v

libpng_CFLAGS = -I${libpng_includedir}
libpng_LDFLAGS = -L${libpng_libdir} -lpng

DEPS_CFLAGS = $DEPS_CFLAGS ${libpng_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libpng_LDFLAGS}
