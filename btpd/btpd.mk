<../v.mk

BIN = \
	btpd/btpd \
	cli/btinfo \
	cli/btcli
LIB = libmisc.a libevloop.a

libmisc_a_OBJ = `{ ls misc/*.c | sed 's/.$/o/'}
libmisc_a_CFLAGS = -I`{ echo $(pwd)/misc }
libmisc_a_LDFLAGS = -L`{ echo $(pwd)/misc } -lmisc -L${libressl_libdir} -lssl -lcrypto

libevloop_a_OBJ = evloop/timer.o evloop/timeheap.o evloop/epoll.o
libevloop_a_CFLAGS = -I`{ echo $(pwd)/evloop }
libevloop_a_LDFLAGS = -L`{ echo $(pwd)/evloop } -levloop

btpd_btpd_OBJ = `{ ls btpd/*.c | sed 's/.$/o/'}
btpd_btpd_CFLAGS = -I./btpd $libmisc_a_CFLAGS $libevloop_a_CFLAGS
btpd_btpd_LDFLAGS = -L. $libmisc_a_LDFLAGS $libevloop_a_LDFLAGS

cli_btinfo_OBJ = cli/btinfo.o
cli_btinfo_CFLAGS = -I./cli $libmisc_a_CFLAGS
cli_btinfo_LDFLAGS = -L. $libmisc_a_LDFLAGS

cli_btcli_OBJ = `{ls cli/*.c | sed 's/.$/o/' | grep -v 'btinfo'}
cli_btcli_CFLAGS = -I./cli $libmisc_a_CFLAGS
cli_btcli_LDFLAGS = -L. $libmisc_a_LDFLAGS

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
	-I${libressl_includedir}
LOCAL_LDFLAGS = -L. -lm -lrt -L${libressl_libdir} -lssl -lcrypto

DEPS = libressl

<$mkbuild/mk.default

btpd_btpd: $LIB
cli_btcli: $LIB
cli_btinfo: $LIB
