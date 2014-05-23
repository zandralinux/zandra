<../v.mk

BIN = src/mpop
OBJ = `{ls src/*.c | sed 's/.$/o/'}

INSTALL_BIN = src/mpop
INSTALL_MAN1 = `{ ls doc/*.1 }

LOCAL_CFLAGS = \
	-I. -include `{pwd}/../config.h -I${openssl_includedir}
LOCAL_LDFLAGS = -L. -L${openssl_libdir} -lssl -lcrypto -lz

DEPS = openssl zlib

<$mkbuild/mk.default
