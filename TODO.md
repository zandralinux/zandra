# Zandra TODO

## missing packages

* groff
* man-db or mandoc
* mg
* x11 stuff
* linux-lts
* nano
* cryptsetup
* dash
* mkbuild

## documentation

* installation guide (network, boot, package management, etc)
* write/find missing man pages

## fixes

* i686 build should use i686 repos (define arch in `/etc/profile`?)
* remove info pages from all packages

## improvements / new features

* pkgtools frontend
* automatically update linux-firmware package monthly
* specify where to post issues, bug reports, questions, comments, changes
* automated pkg tarball and checksum updating via git hooks in repositories
* add linux-lts and maybe hardened kernel, then default to linux-lts
* add donations?
* add mailing list?
* use multiple ports trees and a directory based approach to package management (`pkg install core/gcc` for example)
* ssh box for devs
* change package filename conventions
* split into testing branches
* automate package recompilation when security patches in dependencies are needed (downside of static linking)
	* maybe just use dynamic linking instead?
* Remove info pages by default
* wiki access via command line
* fix i686
* add arm support (rpi4)
* automatic updates for linux-firmware
* use testing branches
* switch # with something else for package versions

