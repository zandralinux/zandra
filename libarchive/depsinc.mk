<$libarchive_DEPDIR/v.mk

libarchive_libdir = $libarchive_DEPDIR/libarchive-$v
libarchive_includedir = $libarchive_DEPDIR/libarchive-$v/libarchive

DEPS_CFLAGS = $DEPS_CFLAGS -I${libarchive_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${libarchive_libdir} -larchive
