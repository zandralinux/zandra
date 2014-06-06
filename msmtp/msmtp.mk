<../v.mk

BIN = src/msmtp
OBJ = `{ls src/*.c | sed 's/.$/o/'}

INSTALL_BIN = src/msmtp
INSTALL_MAN1 = `{ ls doc/*.1 }

LOCAL_CFLAGS = \
	-I. -I../ -include `{pwd}/../config.h -I${openssl_includedir}
LOCAL_LDFLAGS = -L. -L${openssl_libdir} -lssl -lcrypto -lz

DEPS = openssl zlib

<$mkbuild/mk.default

$OBJ: config.h

config.h:
	cp ../config.h config.h
