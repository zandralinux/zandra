<../v.mk

BIN = \
	bzip2 \
	bzip2recover

LIB = libbz2.a

libbz2_a_OBJ = \
	blocksort.o \
	huffman.o \
	crctable.o \
	randtable.o \
	compress.o \
	decompress.o \
	bzlib.o
libbz2_a_LDFLAGS =

bzip2_OBJ = bzip2.o
bzip2_LDFLAGS = -L. -lbz2

bzip2recover_OBJ = bzip2recover.o
bzip2recover_LDFLAGS =

INSTALL_BIN = \
	bzip2 \
	bzip2recover \
	bzmore \
	bzgrep \
	bzdiff

INSTALL_SYMLINK = \
	bzmore /bin/bzless \
	bzip2 /bin/bzcat \
	bzdiff /bin/bzcmp

INSTALL_MAN1 = `{ ls *.1 }

LOCAL_CFLAGS = \
	-D_FILE_OFFSET_BITS=64 \
	-ansi -I.
LOCAL_LDFLAGS = -L.

<$mkbuild/mk.default

bzip2: $LIB

