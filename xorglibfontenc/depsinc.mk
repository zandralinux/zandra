<$xorglibfontenc_DEPDIR/v.mk

xorglibfontenc_includedir = ${xorglibfontenc_DEPDIR}/libfontenc-$v/lib/include
xorglibfontenc_libdir = ${xorglibfontenc_DEPDIR}/libfontenc-$v/lib/lib

DEPS_CFLAGS = $DEPS_CFLAGS -I${xorglibfontenc_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${xorglibfontenc_libdir} -lfontenc
