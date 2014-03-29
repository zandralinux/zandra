<$e2fsprogs_DEPDIR/v.mk

DEPS_CFLAGS = $DEPS_CFLAGS -I$e2fsprogs_DEPDIR/e2fsprogs-$v/lib
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$e2fsprogs_DEPDIR/e2fsprogs-$v/lib/uuid -luuid
