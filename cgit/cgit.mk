# TODO: add lua support? and fix filter_write() in filter.c
#       see: cgit-dlsym.patch
# TODO: -DNO_LUA=1 ?
TARG = cgit
DEPS = git openssl lua zlib
BIN = cgit
OBJ = `{ ls *.c | sed 's/.$/o/'}

INSTALL_BIN = cgit

<../v.mk

<$mkbuild/mk.default

LOCAL_CFLAGS = \
	-DSHA1_HEADER=\"${openssl_includedir}/openssl/sha.h\" \
	-DCGIT_VERSION=\"$v\" \
	-DCGIT_CACHE_ROOT=\"/var/cache/cgit\" \
	-DCGIT_SCRIPT_NAME=\"cgit.cgi\" \
	-DCGIT_SCRIPT_PATH=\"/var/www/htdocs/cgit\" \
	-DCGIT_DATA_PATH=\"/var/www/htdocs/cgit\" \
	-DCGIT_CONFIG=\"/etc/cgitrc\"

LOCAL_LDFLAGS = \
	${git_libdir}/xdiff/lib.a -lgit -lssl -lcrypto -lz
