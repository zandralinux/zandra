<$libgiflib_DEPDIR/v.mk

libgiflib_libdir = $libgiflib_DEPDIR/giflib-$v/lib/lib
libgiflib_includedir = $libgiflib_DEPDIR/giflib-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${libgiflib_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libgiflib_libdir} -lgif
