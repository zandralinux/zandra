TARG = busybox
INSTALL_BIN = busybox
INSTALL_SYMLINK = \
	busybox /bin/addgroup \
	busybox /bin/adduser \
	busybox /bin/bunzip2 \
	busybox /bin/bzcat \
	busybox /bin/bzip2 \
	busybox /bin/delgroup \
	busybox /bin/deluser \
	busybox /bin/fdisk \
	busybox /bin/fuser \
	busybox /bin/gunzip \
	busybox /bin/gzip \
	busybox /bin/ifconfig \
	busybox /bin/ip \
	busybox /bin/kbd_mode \
	busybox /bin/killall \
	busybox /bin/less \
	busybox /bin/losetup \
	busybox /bin/nc \
	busybox /bin/ping \
	busybox /bin/reset \
	busybox /bin/route \
	busybox /bin/tac \
	busybox /bin/telnet \
	busybox /bin/tftp \
	busybox /bin/tftpd \
	busybox /bin/top \
	busybox /bin/wget \
	busybox /bin/xz \
	busybox /bin/xzcat \
	busybox /bin/zcat

<$mkbuild/mk.common

busybox:Q:
	# https://sourceware.org/bugzilla/show_bug.cgi?id=16698
	if test x"$arch" = x"arm"; then
		export LDFLAGS="`printf "%s" \"$LDFLAGS\" | sed 's@-Wl,--gc-sections@@g'`"
		sed 's@^    check_libc_is_glibc.*$@echo ""@g' -i scripts/trylink
	fi
	cp ../busybox.config .config
	make -j$nprocs AR="$AR" HOSTCC="$HOSTCC -static" CC="$CC" LDFLAGS="$LDFLAGS" \
		STRIP="$STRIP" busybox
