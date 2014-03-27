<$zlib_DEPDIR/v.mk

DEPS_CFLAGS = $DEPS_CFLAGS -I$zlib_DEPDIR/zlib-$v
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$zlib_DEPDIR/zlib-$v -lz
