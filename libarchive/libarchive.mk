<../v.mk

BIN = tar/tar cpio/cpio
LIB = libarchive.a libarchive_fe.a
TARG = tar.1 cpio.1
DEPS = zlib

libarchive_a_OBJ = `{ls libarchive/*.c | sed 's/.$/o/' | grep -v '_windows.o$' | grep -v 'archive_entry_copy_bhfi.o$'}
libarchive_fe_a_OBJ = `{ls libarchive_fe/*.c | sed 's/.$/o/'}

cpio_cpio_OBJ = `{ls cpio/*.c | sed 's/.$/o/' | grep -v '_windows.o$'}
tar_tar_OBJ = `{ls tar/*.c | sed 's/.$/o/' | grep -v '_windows.o$'}

LOCAL_BIN_LDFLAGS = -L. -L${zlib_libdir} -lz -larchive -larchive_fe
LOCAL_CFLAGS = -I. -Ilibarchive -Ilibarchive_fe -DHAVE_CONFIG_H

<$mkbuild/mk.default

INSTALL_BIN = tar/tar cpio/cpio
INSTALL_MAN1 = tar.1 cpio.1

$BIN: $LIB

%.1:
	cp $stem/bsd$stem.1 $stem.1

%.o: config.h

config.h:QV:
	cp ../config.h config.h
