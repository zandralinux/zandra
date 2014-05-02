<$xorginputproto_DEPDIR/v.mk

xorginputproto_libdir = ${xorginputproto_DEPDIR}/inputproto-$v/lib
xorginputproto_includedir = ${xorginputproto_DEPDIR}/inputproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorginputproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
