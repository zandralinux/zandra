# TODO: build and package binaries? png2pnm, pngfix, libpng-config etc?

LIB = libpng.a
DEPS = zlib
INSTALL_MAN3 = `{ls -1 *.3}
INSTALL_MAN5 = `{ls -1 *.5}
INSTALL_LIB = libpng.a
INSTALL_OTHER1 = png.h pngconf.h pnglibconf.h
INSTALL_OTHER1_DIR = /include

libpng_a_OBJ = \
	png.o \
	pngerror.o \
	pngget.o \
	pngmem.o \
	pngpread.o \
	pngread.o \
	pngrio.o \
	pngrtran.o \
	pngrutil.o \
   	pngset.o \
	pngtrans.o \
	pngwio.o \
	pngwrite.o \
	pngwtran.o \
	pngwutil.o

NPROC = $nprocs

<$mkbuild/mk.default

$libpng_a_OBJ:V: pnglibconf.h config.h libpngsymlink

# makes sure -lpng16 works.
libpngsymlink:
	ln -sf libpng.a libpng16.a

pnglibconf.h:V:
	cp ../pnglibconf.h pnglibconf.h

config.h:V:
	cp ../config.h config.h
