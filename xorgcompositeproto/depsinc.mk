<$xorgcompositeproto_DEPDIR/v.mk

xorgcompositeproto_libdir = ${xorgcompositeproto_DEPDIR}/compositeproto-$v/lib/lib
xorgcompositeproto_includedir = ${xorgcompositeproto_DEPDIR}/compositeproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgcompositeproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
