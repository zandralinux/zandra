BIN = xz
OBJ = \
	src/xz/args.o \
	src/xz/coder.o \
	src/xz/file_io.o \
	src/xz/hardware.o \
	src/xz/list.o \
	src/xz/main.o \
	src/xz/message.o \
	src/xz/options.o \
	src/xz/signals.o \
	src/xz/suffix.o \
	src/xz/util.o \
	src/common/tuklib_open_stdxxx.o \
	src/common/tuklib_progname.o \
	src/common/tuklib_exit.o \
	src/common/tuklib_cpucores.o \
	src/common/tuklib_mbstr_width.o \
	src/common/tuklib_mbstr_fw.o
INSTALL_BIN = xz
LOCAL_CFLAGS = -I. -Isrc/common -Isrc/liblzma/api -DHAVE_CONFIG_H -std=c99
LOCAL_LDFLAGS = -L. -llzma

<$mkbuild/mk.default

