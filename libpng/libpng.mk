# TODO: build and package binaries? png2pnm, pngfix, libpng-config etc?

LIB = libpng.a
DEPS = zlib
BIN = \
	contrib/pngminus/pnm2png \
	contrib/pngminus/png2pnm
INSTALL_BIN = \
	contrib/pngminus/pnm2png \
	contrib/pngminus/png2pnm
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

LOCAL_CFLAGS = -I.
LOCAL_LDFLAGS =
LOCAL_BIN_LDFLAGS =

contrib_pngminus_pnm2png_LDFLAGS = -L. -lpng
contrib_pngminus_pnm2png_OBJ = \
   contrib/pngminus/pnm2png.o

contrib_pngminus_png2pnm_LDFLAGS = -L. -lpng
contrib_pngminus_png2pnm_OBJ = \
	contrib/pngminus/png2pnm.o

NPROC = $nprocs

<$mkbuild/mk.default

contrib/pngminus/pnm2png: libpng.a

contrib/pngminus/png2pnm: libpng.a

$libpng_a_OBJ:V: pnglibconf.h config.h libpngsymlink

# makes sure -lpng16 works.
libpngsymlink:
	ln -sf libpng.a libpng16.a

pnglibconf.h:V:
	cp ../pnglibconf.h pnglibconf.h

config.h:V:
	cp ../config.h config.h
