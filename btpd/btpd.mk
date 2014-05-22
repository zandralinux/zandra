<../v.mk

# TODO: mk clean doesn't work because $BIN files are not in base dir?
TARG = btpd
BIN = btpd btinfo btcli
LIB = libmisc.a libevloop.a
# TODO: remove CLEAN_FILES once above works?
CLEAN_FILES = btpd/btpd cli/btinfo cli/btcli

libmisc_a_OBJ = `{ ls misc/*.c }
libmisc_a_CFLAGS = -I`{ echo $(pwd)/misc }
libmisc_a_LDFLAGS = -L`{ echo $(pwd)/misc } -lmisc

libevloop_a_OBJ = `{ ls evloop/*.c | sed 's/.$/o/'}
libevloop_a_CFLAGS = -I`{ echo $(pwd)/evloop }
libevloop_a_LDFLAGS = -L`{ echo $(pwd)/evloop } -levloop

btpd_OBJ = `{ ls btpd/*.c | sed 's/.$/o/'}
btpd_CFLAGS = -I./btpd $libmisc_a_CFLAGS $libevloop_a_CFLAGS
btpd_LDFLAGS = $libmisc_a_LDFLAGS $libevloop_a_LDFLAGS

btinfo_OBJ = cli/btinfo.o
btinfo_CFLAGS = -I./cli $libmisc_a_CFLAGS
btinfo_LDFLAGS = $libmisc_a_LDFLAGS

btcli_OBJ = \
	cli/btcli.o \
	cli/add.o \
	cli/del.o \
	cli/list.o \
	cli/kill.o \
	cli/start.o \
	cli/stop.o \
	cli/stat.o
btcli_CFLAGS = -I./cli $libmisc_a_CFLAGS
btcli_LDFLAGS = $libmisc_a_LDFLAGS

INSTALL_BIN = \
	btpd/btpd \
	cli/btinfo \
	cli/btcli
INSTALL_MAN1 = `{ ls doc/*.1 }

# EVLOOP_METHOD = [ EVLOOP_EPOLL, EVLOOP_KQUEUE, EVLOOP_POLL]
LOCAL_CFLAGS = \
	-DPACKAGE_NAME=\"btpd\" \
	-DPACKAGE_VERSION=\"$v\" \
	-D_FILE_OFFSET_BITS=64 -DEVLOOP_EPOLL \
	-std=c99 -I. -Icli -I./btpd $libmisc_a_CFLAGS $libevloop_a_CFLAGS
LOCAL_LDFLAGS = -L. -lm

DEPS = openssl

<$mkbuild/mk.default

btcli: libmisc.a
btinfo: libmisc.a
btpd: libmisc.a libevloop.a
