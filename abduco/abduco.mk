BIN = abduco
OBJ = abduco.o
INSTALL_BIN = abduco
INSTALL_MAN1 = abduco.1
LOCAL_CFLAGS = -std=c99 -DVERSION=\"0.1\"

<$mkbuild/mk.default

%.h: %.def.h
	cp -f $prereq $target

abduco.o: config.h
