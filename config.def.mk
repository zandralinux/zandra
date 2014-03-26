arch = i486
version = 0.0
mirror = http://dl.2f30.org/morpheus-pkgs/${arch}/${version}
ports = $mkbuild/../ports

TOOL_BASE = ${arch}-musl-linux-
CC = ${TOOL_BASE}gcc
LD = $CC
AR = ${TOOL_BASE}ar
RANLIB = ${TOOL_BASE}ranlib
STRIP = ${TOOL_BASE}strip
#STRIP = true
SHELL = /bin/sh

PREFIX =
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib
ETCDIR = ${PREFIX}/etc
DFLDIR = ${ETCDIR}/default
MANDIR = ${PREFIX}/share/man

INSTALL = install

# these don't work for all packages yet...
optldflags = -s -Wl,--gc-sections -Wl,-z,relro,-z,now
optcflags = -fdata-sections -ffunction-sections -Os -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wa,--noexecstack

CPPFLAGS = -D_BSD_SOURCE -D_GNU_SOURCE
CFLAGS = ${CPPFLAGS} # ${optcflags}
LDFLAGS = -static ${optldflags}
