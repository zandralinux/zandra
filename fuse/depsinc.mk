<$fuse_DEPDIR/v.mk

fuse_libdir = $fuse_DEPDIR/fuse-$v/liba/lib
fuse_includedir = $fuse_DEPDIR/fuse-$v/liba/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${fuse_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${fuse_libdir} -lfuse
