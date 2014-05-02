<$xorgxtrans_DEPDIR/v.mk

xorgxtrans_libdir = ${xorgxtrans_DEPDIR}/xtrans-$v/lib
xorgxtrans_includedir = ${xorgxtrans_DEPDIR}/xtrans-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxtrans_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
