<$xorgfixesproto_DEPDIR/v.mk

xorgfixesproto_libdir = ${xorgfixesproto_DEPDIR}/fixesproto-$v/lib/lib
xorgfixesproto_includedir = ${xorgfixesproto_DEPDIR}/fixesproto-$v/lib/include

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgfixesproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
