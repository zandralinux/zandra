BIN = jpegtran
LIB = libjpegturbo.a

INSTALL_BIN = jpegtran
INSTALL_MAN1 = `{ls -1 *.1}

libjpegturbo_a_OBJ = \
	jcapimin.o jcapistd.o jccoefct.o jccolor.o \
	jcdctmgr.o jchuff.o jcinit.o jcmainct.o jcmarker.o jcmaster.o \
	jcomapi.o jcparam.o jcphuff.o jcprepct.o jcsample.o jctrans.o \
	jdapimin.o jdapistd.o jdatadst.o jdatasrc.o jdcoefct.o jdcolor.o \
	jddctmgr.o jdhuff.o jdinput.o jdmainct.o jdmarker.o jdmaster.o \
	jdmerge.o jdphuff.o jdpostct.o jdsample.o jdtrans.o jerror.o \
	jfdctflt.o jfdctfst.o jfdctint.o jidctflt.o jidctfst.o jidctint.o \
	jidctred.o jquant1.o jquant2.o jutils.o jmemmgr.o jmemnobs.o

jpegtran_OBJ = jpegtran.o rdswitch.o cdjpeg.o transupp.o \
	jcarith.o jdarith.o jaricom.o
jpegtran_LDFLAGS = -L. -ljpegturbo

<$mkbuild/mk.default

$libjpegturbo_a_OBJ: jconfig.h config.h libjpegsymlink

# makes sure -ljpeg works.
libjpegsymlink:
	ln -sf libjpegturbo.a libjpeg.a

jconfig.h:V:
	cp ../jconfig.h jconfig.h

config.h:V:
	cp ../config.h config.h
