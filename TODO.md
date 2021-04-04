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

## documentation

* installation guide (network, boot, package management, etc)
* write/find missing man pages

## fixes

* i686 build should use i686 repos (define arch in `/etc/profile`?)
* remove info pages from all packages

## improvements / new features

* pkgtools frontend
* use mirror rather than push to git.zandra.org and github individually (prioritize git.zandra.org)
* automatically update linux-firmware package monthly?
* specify where to post issues, bug reports, questions, comments, changes
* automated pkg tarball and checksum updating via git hooks in repositories
* add linux-lts and maybe hardened kernel
* keep stagit or use cgit?
* figure out crypto donations
* figure out mailing lists
* use multiple ports trees and a directory based approach to package management (`pkg install core/gcc` for example)
* ssh box for devs
* change package filename conventions
* split into testing branches
* automate package recompilation when security patches are needed (downside of static linking)
* default to linux-lts
