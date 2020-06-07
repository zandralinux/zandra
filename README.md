# Zandra Linux

[Zandra Linux](http://zandra.xyz) is a minimal Linux distribution
forked from [morpheus linux](http://morpheus.2f30.org). It aims to be
simple, small, and efficient. Zandra will hopefully get to a point
where it has a stable release cycle, with security patches of course.

## Prerequisites

* A x86\_64-linux-musl toolchain (GNU Binutils, GCC, linux-headers,
  and musl-libc). Can be built using
  [musl-cross-make](https://github.com/richfelker/musl-cross-make).
* mk from [9base](http://tools.suckless.org/9base/) or
  [plan9port](https://github.com/9fans/plan9port).

## Compiling

To compile the base packages, edit config.mk then do the following:

    export configmk=$(pwd)/config.mk # in base directory
    export PATH="$CROSSPATH:$PATH" # add cross compiler to $PATH
    export mkbuild=$(pwd)/mkbuild # in base directory
    mk init # initialize git submodules
    mk

Currently we are in the process of updating packages to their current
versions (before Zandra they were last updated in 2015). Note that
most ports on the testing branch, with the exception of a few, are
outdated and the URLs may not even work.

## Building Packages

Go to the directory of the package you would like to package, then run
`mk package`. You can then host your own package mirrors.

## Installing

You can install to a root using the following:

    export ROOT="desired root"
    mk install

A bootable image can be made using the "bootable" target. IT ASSUMES
`/dev/loop0` IS FREE SO IF IT'S NOT, DON'T RUN THE SCRIPT!!

If you would like to run Zandra on bare metal, it is recommended that
you recompile the kernel (or edit the kernel config before building)
with the drivers you need.
