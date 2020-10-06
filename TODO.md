# Zandra TODO

## missing packages

* groff
* man-db
* mg
* x11 stuff
* linux-lts

## documentation

* installation guide (network, boot, package management, etc)
* write/find missing man pages
* make wiki?

## fixes

* i486 build should use i486 repos (define arch in `/etc/profile`?)
* remove info pages from all packages
* fix native build system on i486

## improvements / new features

* pkgtools frontend
* use i686 instead of i486
* put cacertificates in default install
* use mirror rather than push to git.zandra.xyz and github individually (prioritize git.zandra.xyz)
* automatically update linux-firmware package monthly?
* specify where to post issues, bug reports, questions, comments, changes
* automated pkg tarball and checksum updating via git hooks in repositories
* add linux-lts and maybe hardened kernel
* look for useful userland tweaks
* keep stagit or use cgit?
* figure out crypto donations
* figure out mailing lists
* work on publicity / community
* use multiple ports trees and a directory based approach to package management (`pkg install core/gcc` for example)
* ssh box
