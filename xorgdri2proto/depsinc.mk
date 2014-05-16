<$xorgdri2proto_DEPDIR/v.mk

xorgdri2proto_libdir = $xorgdri2proto_DEPDIR/dri2proto-$v/lib/lib
xorgdri2proto_includedir = $xorgdri2proto_DEPDIR/dri2proto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgdri2proto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorgdri2proto_libdir}
