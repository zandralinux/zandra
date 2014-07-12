<../v.mk

BIN = src/mpop
OBJ = `{ls src/*.c | sed 's/.$/o/'}

INSTALL_BIN = src/mpop
INSTALL_MAN1 = `{ ls doc/*.1 }

LOCAL_CFLAGS = \
	-I. -include config.h -I${libressl_includedir}
LOCAL_LDFLAGS = -L. -L${libressl_libdir} -lssl -lcrypto -lz

DEPS = libressl zlib

<$mkbuild/mk.default

$OBJ: config.h

config.h:QV:
		cp ../config.h config.h
