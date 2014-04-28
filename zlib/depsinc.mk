<$zlib_DEPDIR/v.mk

zlib_libdir = $zlib_DEPDIR/zlib-$v
zlib_includedir = $zlib_DEPDIR/zlib-$v
DEPS_CFLAGS = $DEPS_CFLAGS -I${zlib_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${zlib_libdir} -lz
