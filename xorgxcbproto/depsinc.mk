<$xorgxcbproto_DEPDIR/v.mk

xorgxcbproto_libdir = ${xorgxcbproto_DEPDIR}/xcb-proto-$v/lib
xorgxcbproto_includedir = ${xorgxcbproto_DEPDIR}/xcb-proto-$v/lib/share/xcb
xorgxcbproto_pythonlibdir = ${xorgxcbproto_DEPDIR}/xcb-proto-$v/lib/lib/python2.7/site-packages/ #xcbgen
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxcbproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
