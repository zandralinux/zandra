<$xorgrenderproto_DEPDIR/v.mk

xorgrenderproto_libdir = ${xorgrenderproto_DEPDIR}/renderproto-$v/lib/lib
xorgrenderproto_includedir = ${xorgrenderproto_DEPDIR}/renderproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgrenderproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
