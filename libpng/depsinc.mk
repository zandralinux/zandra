<$libpng_DEPDIR/v.mk

libpng_libdir = $libpng_DEPDIR/libpng-$v/lib/lib
libpng_includedir = $libpng_DEPDIR/libpng-$v/lib/include/libpng16
DEPS_CFLAGS = $DEPS_CFLAGS -I${libpng_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libpng_libdir} -lpng16
