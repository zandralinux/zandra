TARG = lua
DEPS = libedit

INSTALL_BIN = \
	src/lua \
	src/luac
INSTALL_MAN1 = `{ ls doc/*.1 }

<$mkbuild/mk.common

lua:QV:
	export CFLAGS="$CFLAGS $DEPS_CFLAGS"
	export LDFLAGS="$LDFLAGS $DEPS_LDFLAGS"
	#
	make -j$nprocs \
		AR="${AR} rcu" CC="${CC}" RANLIB="${RANLIB}" \
		INSTALL_TOP="`pwd`/lib" \
		MYCFLAGS="-fPIC $CFLAGS" MYLDFLAGS="$LDFLAGS" generic
