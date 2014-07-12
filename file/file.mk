# TODO: bump to version 5.19
<../../v.mk
BIN = file
OBJ = `{ls *.c | sed 's/.$/o/'}
TARG = magic.mgc
INSTALL_BIN = file
INSTALL_OTHER1 = ../magic/magic.mgc
INSTALL_OTHER1_DIR = /share/file
DEPS = zlib

CLEAN_FILES = ../magic/magic.mgc

MAGIC = $PREFIX/share/file/magic
LOCAL_CFLAGS = \
	-DBUILTIN_ELF=1 \
	-DELFCORE=1 \
	-DHAVE_ASCTIME_R=1 \
	-DHAVE_ASPRINTF=1 \
	-DHAVE_CTIME_R=1 \
	-DHAVE_DAYLIGHT=1 \
	-DHAVE_DECL_DAYLIGHT=1 \
	-DHAVE_DECL_TZNAME=1 \
	-DHAVE_DLFCN_H=1 \
	-DHAVE_ERR_H=1 \
	-DHAVE_FCNTL_H=1 \
	-DHAVE_FORK=1 \
	-DHAVE_FSEEKO=1 \
	-DHAVE_GETLINE=1 \
	-DHAVE_GETOPT_H=1 \
	-DHAVE_GETOPT_LONG=1 \
	-DHAVE_GETPAGESIZE=1 \
	-DHAVE_INTTYPES_H=1 \
	-DHAVE_LIBZ=1 \
	-DHAVE_LIMITS_H=1 \
	-DHAVE_LOCALE_H=1 \
	-DHAVE_MBRTOWC=1 \
	-DHAVE_MBSTATE_T=1 \
	-DHAVE_MEMORY_H=1 \
	-DHAVE_MKOSTEMP=1 \
	-DHAVE_MKSTEMP=1 \
	-DHAVE_MMAP=1 \
	-DHAVE_PREAD=1 \
	-DHAVE_STDDEF_H=1 \
	-DHAVE_STDINT_H=1 \
	-DHAVE_STDLIB_H=1 \
	-DHAVE_STRCASESTR=1 \
	-DHAVE_STRERROR=1 \
	-DHAVE_STRINGS_H=1 \
	-DHAVE_STRING_H=1 \
	-DHAVE_STRNDUP=1 \
	-DHAVE_STRTOF=1 \
	-DHAVE_STRTOUL=1 \
	-DHAVE_STRUCT_OPTION=1 \
	-DHAVE_STRUCT_STAT_ST_RDEV=1 \
	-DHAVE_STRUCT_TM_TM_ZONE=1 \
	-DHAVE_SYS_MMAN_H=1 \
	-DHAVE_SYS_PARAM_H=1 \
	-DHAVE_SYS_STAT_H=1 \
	-DHAVE_SYS_TIME_H=1 \
	-DHAVE_SYS_TYPES_H=1 \
	-DHAVE_SYS_WAIT_H=1 \
	-DHAVE_TM_ISDST=1 \
	-DHAVE_TM_ZONE=1 \
	-DHAVE_TZNAME=1 \
	-DHAVE_UNISTD_H=1 \
	-DHAVE_UTIME=1 \
	-DHAVE_UTIMES=1 \
	-DHAVE_UTIME_H=1 \
	-DHAVE_VASPRINTF=1 \
	-DHAVE_VFORK=1 \
	-DHAVE_VISIBILITY=1 \
	-DHAVE_WCHAR_H=1 \
	-DHAVE_WCTYPE_H=1 \
	-DHAVE_WCWIDTH=1 \
	-DHAVE_WORKING_FORK=1 \
	-DHAVE_WORKING_VFORK=1 \
	-DHAVE_ZLIB_H=1 \
	-DPACKAGE="file" \
	-DPACKAGE_BUGREPORT="christos@astron.com" \
	-DPACKAGE_NAME="file" \
	-DPACKAGE_TARNAME="file" \
	-DPACKAGE_URL="" \
	-DPACKAGE_VERSION=\"$v\" \
	-DSTDC_HEADERS=1 \
	-D_ALL_SOURCE=1 \
	-D_GNU_SOURCE=1 \
	-D_POSIX_PTHREAD_SEMANTICS=1 \
	-D_TANDEM_SOURCE=1 \
	-D__EXTENSIONS__=1 \
	-DVERSION=\"$v\" \
	-DMAGIC=\"$MAGIC\"

<$mkbuild/mk.common

file: $OBJ

strcasestr.c:QV:
	printf "\n#ifndef _INTPTR_T_DEFINED\n#define _INTPTR_T_DEFINED\n#define intptr_t int\n#endif\n" > strcasestr.c.tmp
	cat strcasestr.c >> strcasestr.c.tmp
	mv strcasestr.c.tmp strcasestr.c

magic.h:Q:
	sed -e "s/X.YY/$(echo $v | sed -e "s|\.||g")/" < magic.h.in > magic.h

magic.mgc:Q: file
	cd ../magic
	mkdir -p magic
	cp Header Localstuff Magdir/* magic/
	# use host file command to generate magic.mgc
	cd magic
	file -C -m magic
	cp magic.mgc ../
	cd ../
