BIN = unifdef
OBJ = unifdef.o
INSTALL_BIN = unifdef
INSTALL_MAN1 = `{ls *.1}
NPROC = $nprocs

<$mkbuild/mk.common
<../v.mk

LOCAL_CFLAGS = 
LOCAL_LDFLAGS = 
unifdef_LDFLAGS =
LOCAL_BIN_LDFLAGS =
DEPS_LDFLAGS =

&:n: &.o
