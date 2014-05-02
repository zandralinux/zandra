<$fontconfig_DEPDIR/v.mk

fontconfig_libdir = $fontconfig_DEPDIR/fontconfig-$v/lib/lib
fontconfig_includedir = $fontconfig_DEPDIR/fontconfig-$v/lib/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${fontconfig_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${fontconfig_libdir} -lfontconfig
