<../v.mk

TARG = btp
LIB = libmisc.a libevloop.a
CLEAN_FILES = btpd/btpd cli/btinfo cli/btcli
#NOBIN

libmisc_a_OBJ = `{ ls misc/*.c | sed 's/.$/o/'}
libmisc_a_CFLAGS = -I`{ echo $(pwd)/misc }
libmisc_a_LDFLAGS = -L`{ echo $(pwd)/misc } -lmisc -L${openssl_libdir} -lssl -lcrypto

libevloop_a_OBJ = evloop/timer.o evloop/timeheap.o evloop/epoll.o
libevloop_a_CFLAGS = -I`{ echo $(pwd)/evloop }
libevloop_a_LDFLAGS = -L`{ echo $(pwd)/evloop } -levloop

btpd_OBJ = `{ ls btpd/*.c | sed 's/.$/o/'}
btpd_CFLAGS = -I./btpd $libmisc_a_CFLAGS $libevloop_a_CFLAGS
btpd_LDFLAGS = -L. $libmisc_a_LDFLAGS $libevloop_a_LDFLAGS

btinfo_OBJ = cli/btinfo.o
btinfo_CFLAGS = -I./cli $libmisc_a_CFLAGS
btinfo_LDFLAGS = -L. $libmisc_a_LDFLAGS

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
btcli_LDFLAGS = -L. $libmisc_a_LDFLAGS

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
	-DHAVE_CLOCK_MONOTONIC \
	-std=c99 -I. -I./cli -I./btpd ${libmisc_a_CFLAGS} ${libevloop_a_CFLAGS} \
	-I${openssl_includedir}
LOCAL_LDFLAGS = -L. -lm -lrt -L${openssl_libdir} -lssl -lcrypto

DEPS = openssl

<$mkbuild/mk.default

btpd:Q: $LIB $btpd_OBJ
	echo LD $target
	$LD $prereq $LDFLAGS $DEPS_LDFLAGS $LOCAL_LDFLAGS $btpd_LDFLAGS $LOCAL_BIN_LDFLAGS -o btpd/btpd

btinfo:Q: $LIB $btinfo_OBJ
	echo LD $target
	$LD $prereq $LDFLAGS $DEPS_LDFLAGS $LOCAL_LDFLAGS $btinfo_LDFLAGS $LOCAL_BIN_LDFLAGS -o cli/btinfo

btcli:Q: $LIB $btcli_OBJ
	echo LD $target
	$LD $prereq $LDFLAGS $DEPS_LDFLAGS $LOCAL_LDFLAGS $btcli_LDFLAGS $LOCAL_BIN_LDFLAGS -o cli/btcli

btp: $LIB btpd btcli btinfo
	
