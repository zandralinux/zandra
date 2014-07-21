TARG = e2fsprogs

<$mkbuild/mk.common-noinst

e2fsprogs:QV:
	CC="$CC -static" CFLAGS="-D__uint64_t=u_int64_t" ./configure \
		--build="${TOOLCHAIN_TRIPLET}" \
		--host="${HOST_TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--disable-nls \
		--bindir="$BINDIR" \
		--sbindir="$BINDIR" \
		--libexecdir="$BINDIR" \
		--mandir="$PREFIX/share/man"
	make -j$nprocs
	# copy files for use as a dependency.
	rm -rf libdev
	mkdir -p libdev
	cp -a lib libdev/
	rm -f libdev/lib/config.h*

install:QV:
	make -j$nprocs install DESTDIR="$ROOT"
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
