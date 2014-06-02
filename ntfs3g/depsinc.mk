<$ntfs3g_DEPDIR/v.mk

ntfs3g_libdir = $ntfs3g_DEPDIR/ntfs-3g_ntfsprogs-$v/libntfs-3g/.libs
ntfs3g_includedir = $ntfs3g_DEPDIR/ntfs-3g_ntfsprogs-$v/liba/include
DEPS_CFLAGS = $DEPS_CFLAGS -I${ntfs3g_includedir}
DEPS_LDFLAGS = $DEPS_LDFLAGS -L${ntfs3g_libdir} -lntfs-3g
