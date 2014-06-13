<$libnl3_DEPDIR/v.mk

libnl3_libdir = ${libnl3_DEPDIR}/libnl-$v/lib/.libs/
libnl3_includedir = ${libnl3_DEPDIR}/libnl-$v/include

libnl3_cflags = -I${libnl3_includedir}
libnl3_ldflags = -L${libnl3_libdir}

DEPS_CFLAGS = $DEPS_CFLAGS ${libnl3_cflags}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libnl3_ldflags}
