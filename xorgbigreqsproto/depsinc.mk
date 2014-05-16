<$xorgbigreqsproto_DEPDIR/v.mk

xorgbigreqsproto_libdir = ${xorgbigreqsproto_DEPDIR}/bigreqsproto-$v/lib/lib
xorgbigreqsproto_includedir = ${xorgbigreqsproto_DEPDIR}/bigreqsproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgbigreqsproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
