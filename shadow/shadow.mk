BIN = login useradd userdel groupadd groupdel passwd
LIB = libcommon.a libmisc.a
libcommon_a_OBJ = `{ls lib/*.c | sed 's/.$/o/' | grep -v 'tcbfuncs.o$'}
libmisc_a_OBJ = `{ls libmisc/*.c | sed 's/.$/o/' | grep -v 'xgetXXbyYY.o$'}
login_OBJ = src/login.o src/login_nopam.o
useradd_OBJ = src/useradd.o
userdel_OBJ = src/userdel.o
groupadd_OBJ = src/groupadd.o
groupdel_OBJ = src/groupdel.o
passwd_OBJ = src/passwd.o
LOCAL_BIN_LDFLAGS = -L. -lcommon -lmisc

LOCAL_CFLAGS = -I. -Ilib -Ilibmisc -DHAVE_CONFIG_H

INSTALL_BIN = login useradd userdel groupadd groupdel passwd
INSTALL_MAN1 = man/man1/login.1 \
			   man/man1/passwd.1
INSTALL_MAN5 = man/man5/passwd.5
INSTALL_MAN8 = man/man8/useradd.8 \
			   man/man8/userdel.8 \
			   man/man8/groupadd.8 \
			   man/man8/groupdel.8

<$mkbuild/mk.default

NPROC = $nprocs

CFLAGS = 
CPPFLAGS = 

$BIN: $LIB

%.o: config.h

config.h:QV:
	cp ../config.h config.h
