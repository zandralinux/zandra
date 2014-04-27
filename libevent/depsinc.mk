<$libevent_DEPDIR/v.mk

DEPS_CFLAGS = $DEPS_CFLAGS -I$libevent_DEPDIR/libevent-$v/include
DEPS_LDFLAGS = $DEPS_LDFLAGS -L$libevent_DEPDIR/libevent-$v/.libs
