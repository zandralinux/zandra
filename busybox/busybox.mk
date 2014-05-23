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
	busybox /bin/hwclock \
	busybox /bin/ifconfig \
	busybox /bin/ip \
	busybox /bin/kbd_mode \
	busybox /bin/killall \
	busybox /bin/less \
	busybox /bin/login \
	busybox /bin/losetup \
	busybox /bin/nc \
	busybox /bin/passwd \
	busybox /bin/ping \
	busybox /bin/reset \
	busybox /bin/route \
	busybox /bin/sysctl \
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
	cp ../busybox.config .config
	make -j$nprocs AR="$AR" HOSTCC="$HOSTCC -static" CC="$CC" busybox
