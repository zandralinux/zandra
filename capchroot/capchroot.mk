TARG = capchroot
BIN = capchroot
DEPS = libcap

INSTALL_BIN = capchroot
INSTALL_OTHER1_DIR = /etc
INSTALL_OTHER1= capchroot.allow

capchroot_OBJ = \
	capchroot.o \
	configfile.o

<$mkbuild/mk.common

LOCAL_CFLAGS = -DCONFIGFILE=\"/etc/capchroot.allow\"
LOCAL_BIN_LDFLAGS =
LOCAL_LDFLAGS = 
capchroot_LDFLAGS = 
