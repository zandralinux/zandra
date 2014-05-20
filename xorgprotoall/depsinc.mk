<$xorgprotoall_DEPDIR/v.mk
<$xorgprotoall_DEPDIR/deps.mk

xorgprotoall_libdir = 
xorgprotoall_includedir = 

# get cflags and ldflags of deps.
`{ for dep in $DEPS; do \
	echo "${dep}_DEPDIR = ${xorgprotoall_DEPDIR}/../$dep"; \
	echo "<${xorgprotoall_DEPDIR}/../$dep/depsinc.mk"; \
done > $xorgprotoall_DEPDIR/.cache_deps.mk }

<$xorgprotoall_DEPDIR/.cache_deps.mk
