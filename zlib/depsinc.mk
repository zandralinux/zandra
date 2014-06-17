<$zlib_DEPDIR/v.mk

zlib_libdir = ${zlib_DEPDIR}/zlib-$v
zlib_includedir = ${zlib_DEPDIR}/zlib-$v

zlib_CFLAGS = $DEPS_CFLAGS -I${zlib_includedir}
zlib_LDFLAGS = $DEPS_LDFLAGS -L${zlib_libdir} -lz

DEPS_CFLAGS = ${zlib_CFLAGS}
DEPS_LDFLAGS = ${zlib_LDFLAGS}
