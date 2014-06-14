TARG = fcgiwrap
DEPS = fastcgi

INSTALL_BIN = fcgiwrap
INSTALL_MAN8 = fcgiwrap.8

BIN = fcgiwrap
OBJ = fcgiwrap.o

<$mkbuild/mk.default

<../v.mk

LOCAL_CFLAGS = \
	-DPACKAGE_NAME=\"fcgiwrap\" \
	-DPACKAGE_VERSION=\"$v\" \
	-DPACKAGE_BUGREPORT=\"root@localdomain.pl\"

LOCAL_LDFLAGS =

$OBJ: config.h

config.h:
	touch config.h
