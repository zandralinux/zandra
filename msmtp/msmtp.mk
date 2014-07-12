<../v.mk

BIN = src/msmtp
OBJ = `{ls src/*.c | sed 's/.$/o/'}

INSTALL_BIN = src/msmtp
INSTALL_MAN1 = `{ ls doc/*.1 }

LOCAL_CFLAGS = \
	-I. -I../ -include `{pwd}/../config.h -I${libressl_includedir}
LOCAL_LDFLAGS = -L. -L${libressl_libdir} -lssl -lcrypto -lz

DEPS = libressl zlib

<$mkbuild/mk.default

$OBJ: config.h

config.h:
	cp ../config.h config.h
