BIN = dvtm
OBJ = dvtm.o vt.o
INSTALL_BIN = dvtm
INSTALL_MAN1 = dvtm.1
v = `{grep ^VERSION config.mk | cut -f 3 -d ' '}
LOCAL_CFLAGS = -std=c99 -DVERSION=\"$v\"
LOCAL_LDFLAGS = -lncursesw
DEPS = ncurses

<$mkbuild/mk.default
CFLAGS =
CPPFLAGS =

%.h: %.def.h
	cp -f $prereq $target

dvtm.o: config.h
