<$openssl_DEPDIR/v.mk

openssl_includedir = $openssl_DEPDIR/openssl-$v/include
openssl_libdir = $openssl_DEPDIR/openssl-$v
DEPS_CFLAGS = $DEPS_CFLAGS -I$openssl_includedir
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$openssl_libdir -lssl
