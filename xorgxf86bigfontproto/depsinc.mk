<$xorgxf86bigfontproto_DEPDIR/v.mk

xorgxf86bigfontproto_libdir = ${xorgxf86bigfontproto_DEPDIR}/xf86bigfontproto-$v/lib
xorgxf86bigfontproto_includedir = ${xorgxf86bigfontproto_DEPDIR}/xf86bigfontproto-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${xorgxf86bigfontproto_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS
