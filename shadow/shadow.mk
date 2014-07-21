BIN = useradd userdel groupadd groupdel
LIB = libcommon.a libmisc.a
libcommon_a_OBJ = `{ls lib/*.c | sed 's/.$/o/' | grep -v 'tcbfuncs.o$'}
libmisc_a_OBJ = `{ls libmisc/*.c | sed 's/.$/o/' | grep -v 'xgetXXbyYY.o$'}
useradd_OBJ = src/useradd.o
userdel_OBJ = src/userdel.o
groupadd_OBJ = src/groupadd.o
groupdel_OBJ = src/groupdel.o
LOCAL_BIN_LDFLAGS = -L. -lcommon -lmisc

LOCAL_CFLAGS = -I. -Ilib -Ilibmisc -DHAVE_CONFIG_H

INSTALL_BIN = useradd userdel groupadd groupdel
INSTALL_MAN8 = man/man8/useradd.8 \
	man/man8/userdel.8 \
	man/man8/groupadd.8 \
	man/man8/groupdel.8

INSTALL_OTHER1 = etc/login.defs
INSTALL_OTHER1_DIR = /etc

<$mkbuild/mk.default

NPROC = $nprocs

CFLAGS =
CPPFLAGS =

$BIN: $LIB

%.o: config.h

config.h:QV:
	cp ../config.h config.h
