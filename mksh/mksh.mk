<../v.mk

BIN = mksh
OBJ = \
	edit.o \
	eval.o \
	exec.o \
	expr.o \
	funcs.o \
	histrap.o \
	jobs.o \
	lalloc.o \
	lex.o \
	main.o \
	misc.o \
	shf.o \
	strlcpy.o \
	syn.o \
	tree.o \
	var.o

<$mkbuild/mk.default

INSTALL_BIN = mksh
INSTALL_MAN1 = mksh.1
INSTALL_SYMLINK = \
	mksh $BINDIR/sh \
	mksh.1 $MANDIR/man1/sh.1 \
	mksh $BINDIR/ksh \
	mksh.1 $MANDIR/man1/ksh.1
LOCAL_CFLAGS = \
	-I.  -DMKSH_BUILDSH -D_GNU_SOURCE -DSETUID_CAN_FAIL_WITH_EAGAIN \
	-DHAVE_ATTRIBUTE_BOUNDED=0 -DHAVE_ATTRIBUTE_FORMAT=1 \
	-DHAVE_ATTRIBUTE_NORETURN=1 -DHAVE_ATTRIBUTE_UNUSED=1 \
	-DHAVE_ATTRIBUTE_USED=1 -DHAVE_SYS_TIME_H=1 -DHAVE_TIME_H=1 \
	-DHAVE_BOTH_TIME_H=1 -DHAVE_SYS_BSDTYPES_H=0 -DHAVE_SYS_FILE_H=1 \
	-DHAVE_SYS_MKDEV_H=0 -DHAVE_SYS_MMAN_H=1 -DHAVE_SYS_PARAM_H=1 \
	-DHAVE_SYS_RESOURCE_H=1 -DHAVE_SYS_SELECT_H=1 -DHAVE_SYS_SYSMACROS_H=1 \
	-DHAVE_BSTRING_H=0 -DHAVE_GRP_H=1 -DHAVE_LIBGEN_H=1 -DHAVE_LIBUTIL_H=0 \
	-DHAVE_PATHS_H=1 -DHAVE_STDINT_H=1 -DHAVE_STRINGS_H=1 -DHAVE_TERMIOS_H=1 \
	-DHAVE_ULIMIT_H=1 -DHAVE_VALUES_H=1 -DHAVE_CAN_INTTYPES=1 \
	-DHAVE_CAN_UCBINTS=1 -DHAVE_CAN_INT8TYPE=1 -DHAVE_CAN_UCBINT8=1 \
	-DHAVE_RLIM_T=1 -DHAVE_SIG_T=1 -DHAVE_SYS_ERRLIST=0 -DHAVE_SYS_SIGNAME=0 \
	-DHAVE_SYS_SIGLIST=0 -DHAVE_FLOCK=1 -DHAVE_LOCK_FCNTL=1 -DHAVE_GETRUSAGE=1 \
	-DHAVE_GETTIMEOFDAY=1 -DHAVE_KILLPG=1 -DHAVE_MEMMOVE=1 -DHAVE_MKNOD=0 \
	-DHAVE_MMAP=1 -DHAVE_NICE=1 -DHAVE_REVOKE=0 -DHAVE_SETLOCALE_CTYPE=1 \
	-DHAVE_LANGINFO_CODESET=1 -DHAVE_SELECT=1 -DHAVE_SETRESUGID=1 \
	-DHAVE_SETGROUPS=1 -DHAVE_STRERROR=1 -DHAVE_STRSIGNAL=1 -DHAVE_STRLCPY=1 \
	-DHAVE_FLOCK_DECL=1 -DHAVE_REVOKE_DECL=1 -DHAVE_SYS_ERRLIST_DECL=0 \
	-DHAVE_SYS_SIGLIST_DECL=0 -DHAVE_PERSISTENT_HISTORY=1 -DMKSH_BUILD_R=$BUILD

CLEAN_FILES = signames.inc

histrap.o: signames.inc

signames.inc:
	cat > signames.inc << EOF
                { "INT", 2 },
                { "SEGV", 11 },
                { "ABRT", 6 },
                { "KILL", 9 },
                { "ALRM", 14 },
                { "BUS", 7 },
                { "CHLD", 17 },
                { "CONT", 18 },
                { "FPE", 8 },
                { "HUP", 1 },
                { "ILL", 4 },
                { "IO", 29 },
                { "PIPE", 13 },
                { "PROF", 27 },
                { "PWR", 30 },
                { "QUIT", 3 },
                { "STOP", 19 },
                { "SYS", 31 },
                { "TERM", 15 },
                { "TRAP", 5 },
                { "TSTP", 20 },
                { "TTIN", 21 },
                { "TTOU", 22 },
                { "URG", 23 },
                { "USR1", 10 },
                { "USR2", 12 },
                { "VTALRM", 26 },
                { "WINCH", 28 },
                { "XCPU", 24 },
                { "XFSZ", 25 },
                { "STKFLT", 16 },
	EOF
