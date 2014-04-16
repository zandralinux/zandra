BIN = pigz
OBJ = pigz.o yarn.o zopfli/deflate.o zopfli/blocksplitter.o zopfli/tree.o zopfli/lz77.o zopfli/cache.o zopfli/hash.o zopfli/util.o zopfli/squeeze.o zopfli/katajainen.o
LOCAL_LDFLAGS = -lpthread -lz -lm
DEPS = zlib

<$mkbuild/mk.default

INSTALL_BIN = pigz
INSTALL_MAN1 = pigz.1
INSTALL_SYMLINK = \
	pigz /bin/gzip \
	pigz.1 $MANDIR/man1/gzip.1

