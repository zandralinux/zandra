<$libressl_DEPDIR/v.mk

libressl_bindir = ${libressl_DEPDIR}/libressl-$v/lib/bin
libressl_libdir = ${libressl_DEPDIR}/libressl-$v/lib/lib
libressl_includedir = ${libressl_DEPDIR}/libressl-$v/lib/include

libressl_CFLAGS = -I${libressl_includedir}
libressl_LDFLAGS = -L${libressl_libdir} -lssl

DEPS_CFLAGS = $DEPS_CFLAGS ${libressl_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${libressl_LDFLAGS}
