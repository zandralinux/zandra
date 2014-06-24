LIB = libtermcap.a

libtermcap_a_OBJ = \
	termcap.o \
	tparam.o \
	version.o
LOCAL_CFLAGS = -DHAVE_STRING_H=1 -DHAVE_UNISTD_H=1 -DSTDC_HEADERS=1 -DTERMCAP_FILE=\"/etc/termcap\"

INSTALL_OTHER1_DIR = \
	include

INSTALL_OTHER1 = \
	termcap.h

<$mkbuild/mk.default

DEPS_CFLAGS = 
DEPS_LDFLAGS =
