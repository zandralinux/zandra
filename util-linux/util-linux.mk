BIN = fdisk cfdisk hwclock losetup
LIB = libuuid.a libfdisk.a libcommon.a libblkid.a

libcommon_a_OBJ = `{ls lib/*.c | sed 's/.$/o/'}
libfdisk_a_OBJ = `{ls libfdisk/src/*.c | sed 's/.$/o/'}
libuuid_a_OBJ = `{ls libuuid/src/*.c | sed 's/.$/o/'}
libblkid_a_OBJ = `{for dir in partitions superblocks topology; do ls libblkid/src/$dir/*.c | sed 's/.$/o/'; done; ls libblkid/src/*.c | sed 's/.$/o/'}

fdisk_OBJ = fdisks/fdisk.o fdisks/fdisk-ask.o fdisks/fdisk-menu.o
fdisk_LDFLAGS = -L. -luuid -lfdisk -lcommon -lblkid

cfdisk_OBJ = fdisks/cfdisk.o
cfdisk_LDFLAGS = -lncursesw $fdisk_LDFLAGS

hwclock_OBJ = sys-utils/hwclock.o sys-utils/hwclock-cmos.o sys-utils/hwclock-rtc.o sys-utils/hwclock-kd.o
hwclock_LDFLAGS = -L. -lcommon

losetup_OBJ = sys-utils/losetup.o
losetup_LDFLAGS = -L. -lcommon

INSTALL_BIN = fdisk cfdisk hwclock losetup
INSTALL_MAN8 = fdisks/fdisk.8 fdisks/cfdisk.8 sys-utils/hwclock.8 sys-utils/losetup.8

LOCAL_CFLAGS = -include config.h -Iinclude -Ilibfdisk/src -Ilibuuid/src -Ilibblkid/src -I.
DEPS = ncurses

<$mkbuild/mk.default

%.o: config.h

fdisk: $LIB
cfdisk: $LIB

config.h:QV:
	cp ../util-linux-config.h config.h
