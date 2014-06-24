<$libcap_DEPDIR/v.mk

libcap_bindir = ${libcap_DEPDIR}/libcap-$v/lib/bin
libcap_libdir = ${libcap_DEPDIR}/libcap-$v/lib/lib
libcap_includedir = ${libcap_DEPDIR}/libcap-$v/lib/include

libcap_CFLAGS = -I${libcap_includedir}
libcap_LDFLAGS = -L${libcap_libdir} -lcap

DEPS_CFLAGS = $DEPS_CFLAGS ${libcap_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libcap_LDFLAGS}
