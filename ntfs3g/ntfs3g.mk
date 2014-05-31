TARG = ntfs3g
INSTALL_BIN = \
	src/lowntfs-3g \
	src/ntfs-3g \
	src/ntfs-3g.probe \
	src/ntfs-3g.secaudit \
	src/ntfs-3g.usermap \
	ntfsprogs/mkntfs \
	ntfsprogs/ntfscat \
	ntfsprogs/ntfsclone \
	ntfsprogs/ntfscluster \
	ntfsprogs/ntfscmp \
	ntfsprogs/ntfscp \
	ntfsprogs/ntfsfix \
	ntfsprogs/ntfsinfo \
	ntfsprogs/ntfslabel \
	ntfsprogs/ntfsls \
	ntfsprogs/ntfsresize \
	ntfsprogs/ntfsundelete

INSTALL_MAN8 = `{ ls -1 src/*.8; ls -1 ntfsprogs/*.8 }
INSTALL_SYMLINK = \
	mkntfs /bin/mkfs.ntfs \
	lowntfs-3g /bin/mount.lowntfs-3g \
	ntfs-3g /bin/mount.ntfs-3g 

<$mkbuild/mk.common

ntfs3g:QV:
	./configure \
		--prefix="$prefix" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-really-static \
		--enable-mount-helper \
		--enable-static
	make -j$nprocs LDFLAGS="-all-static $LDFLAGS"
