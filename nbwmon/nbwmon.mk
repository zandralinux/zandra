BIN = nbwmon
OBJ = nbwmon.o
INSTALL_BIN = nbwmon
LOCAL_CFLAGS = -std=c99
LOCAL_LDFLAGS = -lncursesw
DEPS = ncurses

<$mkbuild/mk.default
