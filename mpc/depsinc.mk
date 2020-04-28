<$mpc_DEPDIR/v.mk

mpc_includedir = $mpc_DEPDIR/mpc-$v/lib/include
mpc_libdir = $mpc_DEPDIR/mpc-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I$mpc_DEPDIR/mpc-$v/lib/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$mpc_DEPDIR/mpc-$v/lib/lib
