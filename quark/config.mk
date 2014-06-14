# quark version
VERSION = 0.1

# Customize below to fit your system

# paths
MANPREFIX = ${PREFIX}/share/man

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_GNU_SOURCE
CFLAGS += ${CPPFLAGS}
