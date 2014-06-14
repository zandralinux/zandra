<$git_DEPDIR/v.mk

git_bindir = ${git_DEPDIR}/git-$v
git_libdir = ${git_DEPDIR}/git-$v
git_includedir = ${git_DEPDIR}/git-$v

git_CFLAGS = -I${git_includedir}
git_LDFLAGS = -L${git_libdir} -lgit

DEPS_CFLAGS = $DEPS_CFLAGS ${git_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${git_LDFLAGS}
