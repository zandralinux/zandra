top = `{pwd}
root = ${top}/root
#arch = i486
arch = x86_64
libcroot = ${root}/opt/cross/${arch}-linux-musl/${arch}-linux-musl
nprocs = 4
version = 0.0
mirror = http://dl.2f30.org/morpheus-pkgs/${arch}/${version}
CC = ${arch}-linux-musl-gcc

optldflags = "-s -Wl,--gc-sections -Wl,-z,relro,-z,now"
optcflags = "-fdata-sections -ffunction-sections -Os -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wa,--noexecstack"

PATH = ${root}/opt/cross/${arch}-linux-musl/bin:${PATH}
