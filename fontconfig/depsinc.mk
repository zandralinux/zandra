<$fontconfig_DEPDIR/v.mk

fontconfig_libdir = $fontconfig_DEPDIR/fontconfig-$v/lib/lib
fontconfig_includedir = $fontconfig_DEPDIR/fontconfig-$v/lib/include

fontconfig_CFLAGS = -I${fontconfig_includedir}
fontconfig_LDFLAGS = -L${fontconfig_libdir} -lfontconfig

DEPS_CFLAGS = $DEPS_CFLAGS ${fontconfig_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${fontconfig_LDFLAGS}
