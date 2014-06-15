<$openssl_DEPDIR/v.mk

openssl_includedir = ${openssl_DEPDIR}/openssl-$v/include
openssl_libdir = ${openssl_DEPDIR}/openssl-$v

openssl_CFLAGS = -I${openssl_includedir}
openssl_LDFLAGS = -L${openssl_libdir} -lssl

DEPS_CFLAGS = $DEPS_CFLAGS ${openssl_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${openssl_LDFLAGS}
