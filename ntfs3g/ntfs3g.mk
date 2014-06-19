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

INSTALL_SYMLINK = \
	mkntfs /bin/mkfs.ntfs \
	lowntfs-3g /bin/mount.lowntfs-3g \
	ntfs-3g /bin/mount.ntfs-3g

<$mkbuild/mk.common

# man pages are suffixed with .in, so copy those manually.
installman8:QV:
	i=8
	$INSTALL -d -m 755 ${ROOT}${PREFIX}$MANDIR/man$i
	for f in ` ls -1 src/*.8.in; ls -1 ntfsprogs/*.$i.in`; do
		fn=`basename $f | sed 's@.in$@@g'`
		echo INSTALL ${ROOT}${PREFIX}$MANDIR/man$i/$fn
		$INSTALL -m 644 $f ${ROOT}${PREFIX}$MANDIR/man$i/$fn
	done

install_man: installman8

ntfs3g:QV:
	./configure \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-really-static \
		--enable-mount-helper \
		--enable-static
	make -j$nprocs install \
		LDFLAGS="-all-static $LDFLAGS" DESTDIR="`pwd`/liba"
	# remove .la files for now ?
	find "`pwd`/liba" -iname "*.la" -exec rm {} \;
