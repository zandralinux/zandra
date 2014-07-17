TARG = strace
INSTALL_MAN1 = strace.1
INSTALL_BIN = \
	strace \
	strace-log-merge \
	strace-graph

<$mkbuild/mk.common

strace:QV:
	# patch configure
	sed -i -e 's/include <linux\/socket.h>/include <sys\/socket.h>/g' configure
	# patch sys/poll.h
	find -name "*.[ch]" -exec sed 's@sys/poll.h@poll.h@g' -i {} \;
	# remove sys/sysinfo.h include.
	find -name "*.[ch]" -exec sed 's@#include <sys/sysinfo.h>@@g' -i {} \;
	export CFLAGS="$CFLAGS -Dsigcontext_struct=sigcontext"
	# NOTE: --host is set to TOOLCHAIN_TRIPLET (not HOST_TOOLCHAIN_TRIPLET)
	#       because asm include bits per arch are needed.
	#       --build is not defined because --build should be != --host in
	#       configure.
	CC="$CC" ./configure \
		--host="${TOOLCHAIN_TRIPLET}" \
		--prefix="$PREFIX" \
		--mandir="$ROOT/share/man" \
		--disable-shared \
		--enable-static \
		ac_cv_have_long_long_off_t=yes
	make -j$nprocs
