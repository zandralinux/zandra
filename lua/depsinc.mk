<$lua_DEPDIR/v.mk

lua_bindir = ${lua_DEPDIR}/lua-$v/src
lua_libdir = ${lua_DEPDIR}/lua-$v/src
lua_includedir = ${lua_DEPDIR}/lua-$v/src

lua_CFLAGS = -I${lua_includedir}
lua_LDFLAGS = -L${lua_libdir} -llua

DEPS_CFLAGS = $DEPS_CFLAGS ${lua_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${lua_LDFLAGS}
