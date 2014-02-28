top = `{pwd}
root = ${top}/root
#arch = i486
arch = x86_64
libcroot = ${root}/opt/cross/${arch}-linux-musl/${arch}-linux-musl
nprocs = 4
version = 0.0
mirror = http://dl.2f30.org/morpheus-pkgs/${arch}/${version}
CC = ${arch}-linux-musl-gcc

# these don't work for all packages yet...
optldflags = -s -Wl,--gc-sections -Wl,-z,relro,-z,now
optcflags = -fdata-sections -ffunction-sections -Os -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wa,--noexecstack

CFLAGS = -I${libcroot}/include -static # ${optcflags}
LDFLAGS = -L${libcroot}/lib -static # ${optldflags}

PATH = ${root}/opt/cross/${arch}-linux-musl/bin:${PATH}
