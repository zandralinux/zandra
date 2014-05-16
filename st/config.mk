# st version
VERSION = 0.5

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" -D_BSD_SOURCE -D_XOPEN_SOURCE=600
CFLAGS += -std=c99 -pedantic -Wall -Wvariadic-macros ${CPPFLAGS}
#LDFLAGS += ${LIBS}
