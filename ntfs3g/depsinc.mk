<$ntfs3g_DEPDIR/v.mk

ntfs3g_libdir = $ntfs3g_DEPDIR/ntfs-3g_ntfsprogs-$v/libntfs-3g/.libs
ntfs3g_includedir = $ntfs3g_DEPDIR/ntfs-3g_ntfsprogs-$v/liba/include

ntfs3g_CFLAGS = -I${ntfs3g_includedir}
ntfs3g_LDFLAGS = -L${ntfs3g_libdir} -lntfs-3g

DEPS_CFLAGS = $DEPS_CFLAGS ${ntfs3g_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${ntfs3g_LDFLAGS}
