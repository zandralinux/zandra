<$mpc_DEPDIR/v.mk

DEPS_CFLAGS = $DEPS_CFLAGS -I$mpc_DEPDIR/mpc-$v/lib/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$mpc_DEPDIR/mpc-$v/lib/lib
