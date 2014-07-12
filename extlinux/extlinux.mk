BIN = extlinux
OBJ = bootsect_bin.o ldlinux_bin.o ldlinuxc32_bin.o \
	  ../libinstaller/syslxcom.o \
	  ../libinstaller/syslxopt.o \
	  ../libinstaller/syslxmod.o \
	  ../libinstaller/setadv.o \
	  ../libinstaller/advio.o \
	  ../extlinux/main.o \
	  ../extlinux/mountinfo.o

INSTALL_BIN = extlinux
INSTALL_OTHER1 = ../../extlinux.conf
INSTALL_OTHER1_DIR = /boot
LOCAL_CFLAGS = -I../libinstaller -I../extlinux -I../bios -D_FILE_OFFSET_BITS=64
DEPS = e2fsprogs

<$mkbuild/mk.common

CPPFLAGS =

bin2c:Q:
	echo "CC $target"
	$HOSTCC -static -o $target ../../bin2c.c

bootsect_bin.c:Q: bin2c
	./bin2c ../bios/core/ldlinux.bss $target syslinux_bootsect
ldlinux_bin.c:Q: bin2c
	./bin2c ../bios/core/ldlinux.sys $target syslinux_ldlinux 512
ldlinuxc32_bin.c:Q: bin2c
	./bin2c ../bios/com32/elflink/ldlinux/ldlinux.c32 $target syslinux_ldlinuxc32

extlinux: $OBJ

