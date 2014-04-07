arch = i486
version = 0.0
mirror = http://dl.2f30.org/morpheus-pkgs/${arch}/${version}
pkgdirs = $mkbuild/../ports
nprocs = 2

TOOLCHAIN_TRIPLET = ${arch}-musl-linux
CC = ${TOOLCHAIN_TRIPLET}-gcc
HOSTCC = $CC -static
LD = $CC
AR = ${TOOLCHAIN_TRIPLET}-ar
RANLIB = ${TOOLCHAIN_TRIPLET}-ranlib
STRIP = ${TOOLCHAIN_TRIPLET}-strip
#STRIP = true
SHELL = /bin/sh

PREFIX =
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib
ETCDIR = ${PREFIX}/etc
DFLDIR = ${ETCDIR}/default
MANDIR = ${PREFIX}/share/man

INSTALL = /usr/bin/install

# these don't work for all packages yet...
optldflags = -s -Wl,--gc-sections -Wl,-z,relro,-z,now
optcflags = -fdata-sections -ffunction-sections -Os -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wa,--noexecstack

CPPFLAGS = -D_BSD_SOURCE -D_GNU_SOURCE
CFLAGS = ${CPPFLAGS} # ${optcflags}
LDFLAGS = -static ${optldflags}
