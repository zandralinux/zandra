TARG = e2fsprogs

<$mkbuild/mk.common-noinst

e2fsprogs:QV:
	CC="$CC -static" CFLAGS="-D__uint64_t=u_int64_t" ./configure --prefix="" \
		--bindir="$BINDIR" --sbindir="$BINDIR" --libexecdir="$BINDIR" \
		--mandir="/share/man" --disable-nls
	make -j$nprocs

install:QV:
	make -j$nprocs DESTDIR="$ROOT" install
	cd "$ROOT""$BINDIR"
	rm -f mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.ext4dev
	rm -f fsck.ext2 fsck.ext3 fsck.ext4 fsck.ext4dev
	ln -s mke2fs mkfs.ext2
	ln -s mke2fs mkfs.ext3
	ln -s mke2fs mkfs.ext4
	ln -s mke2fs mkfs.ext4dev
	ln -s e2fsck fsck.ext2
	ln -s e2fsck fsck.ext3
	ln -s e2fsck fsck.ext4
	ln -s e2fsck fsck.ext4dev

