BIN = sinit
OBJ = sinit.o
INSTALL_BIN = sinit
INSTALL_MAN8 = sinit.8
INSTALL_SYMLINK = sinit /bin/init

<$mkbuild/mk.default

%.h: %.def.h
	cp -f $prereq $target

sinit.o: config.h

