<$curl_DEPDIR/v.mk

curl_includedir = $curl_DEPDIR/curl-$v/lib/include
curl_libdir = $curl_DEPDIR/curl-$v/lib/lib

curl_CFLAGS = -I${curl_includedir} -DCURL_STATICLIB
curl_LDFLAGS = -L${curl_libdir} -lcurl

DEPS_CFLAGS = $DEPS_CFLAGS ${curl_CFLAGS}
DEPS_LDFLAGS = $DEPS_LDFLAGS ${curl_LDFLAGS}
