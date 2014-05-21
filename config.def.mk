arch = x86_64
version = 0.0
mirror = http://dl.2f30.org/morpheus-pkgs/${arch}/${version}
pkgdirs = $mkbuild/../ports
nprocs = 2

TOOLCHAIN_TRIPLET = ${arch}-musl-linux
CC = ${TOOLCHAIN_TRIPLET}-gcc
CXX = ${TOOLCHAIN_TRIPLET}-g++
LD = $CC
AR = ${TOOLCHAIN_TRIPLET}-ar
RANLIB = ${TOOLCHAIN_TRIPLET}-ranlib
STRIP = ${TOOLCHAIN_TRIPLET}-strip
CPP = ${TOOLCHAIN_TRIPLET}-cpp

HOST_TOOLCHAIN_TRIPLET = ${arch}-musl-linux
HOSTCC = $CC -static
# use STRIP = true instead of the above
# if you do not want stripped binaries
#STRIP = true
SHELL = /bin/sh

PREFIX =
BINDIR = ${PREFIX}/bin
LIBDIR = ${PREFIX}/lib
ETCDIR = ${PREFIX}/etc
DFLDIR = ${ETCDIR}/default
MANDIR = ${PREFIX}/share/man

INSTALL = /usr/bin/install
SUM = sha512sum

# these don't work for all packages yet...
optldflags = -s -Wl,--gc-sections -Wl,-z,relro,-z,now
optcflags = -fdata-sections -ffunction-sections -Os -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wa,--noexecstack

CPPFLAGS = -D_BSD_SOURCE -D_GNU_SOURCE
CFLAGS = ${CPPFLAGS} # ${optcflags}
LDFLAGS = -static ${optldflags}
