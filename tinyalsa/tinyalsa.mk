BIN = tinyplay tinycap tinymix tinypcminfo
tinyplay_OBJ = tinyplay.o
tinycap_OBJ = tinycap.o
tinymix_OBJ = tinymix.o
tinypcminfo_OBJ = tinypcminfo.o
LIB = libtinyalsa.a
LOBJ = mixer.o pcm.o

LOCAL_CFLAGS = -Iinclude
LOCAL_LDFLAGS = -L. -ltinyalsa

INSTALL_BIN = tinyplay tinycap tinymix tinypcminfo

<$mkbuild/mk.default

$BIN: $LIB