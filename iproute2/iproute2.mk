BIN = ip/ip ip/rtmon #tc/tc
LIB = lib/libutil.a
lib_libutil_a_OBJ = `{ls lib/*.c | sed 's/.$/o/'}
ip_ip_OBJ = `{ls ip/*.c | sed 's/.$/o/' | grep -v 'rtmon.o$'}
ip_rtmon_OBJ = ip/rtmon.o
#tc_tc_OBJ = `{ls tc/*.c | sed 's/.$/o/' | grep -v 'em_ipset.o$' | grep -v 'm_ipt.o$' | grep -v 'm_xt_old.o$' | grep -v 'q_atm.o$'} tc/emp_ematch.o
LOCAL_BIN_LDFLAGS = -Llib -lutil

LOCAL_CFLAGS = -Iinclude -DHAVE_SETNS

CLEAN_FILES = ip/static-syms.h

INSTALL_BIN = ip/ip ip/rtmon
INSTALL_MAN8 = man/man8/ip.8 man/man8/rtmon.8

#DEPS = yacc lex iptables

<$mkbuild/mk.default

$BIN: $LIB

#tc/emp_ematch.c: tc/emp_ematch.y
#	$YACC -L $prereq
#	mv y.tab.c $target

#tc/static-syms.o: tc/static-syms.h
#tc/static-syms.h: `{ls tc/*.c}

ip/static-syms.o: ip/static-syms.h
ip/static-syms.h: `{ls ip/*.c}

%/static-syms.h:Q:
	for s in `grep -B 3 '\<dlsym' $prereq | sed -n '/snprintf/{s:.*"\([^"]*\)".*:\1:;s:%s::;p}'` ; do
		sed -n '/'$s'[^ ]* =/{s:.* \([^ ]*'$s'[^ ]*\) .*:extern char \1[] __attribute__((weak)); if (!strcmp(sym, "\1")) return \1;:;p}' $prereq
	done > $target
