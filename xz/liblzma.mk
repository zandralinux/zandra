
LIB = liblzma.a
LOBJ = \
	src/common/tuklib_physmem.o \
	src/liblzma/delta/delta_common.o \
	src/liblzma/delta/delta_encoder.o \
	src/liblzma/delta/delta_decoder.o \
	src/liblzma/common/common.o \
	src/liblzma/common/block_util.o \
	src/liblzma/common/easy_preset.o \
	src/liblzma/common/filter_common.o \
	src/liblzma/common/hardware_physmem.o \
	src/liblzma/common/index.o \
	src/liblzma/common/stream_flags_common.o \
	src/liblzma/common/vli_size.o \
	src/liblzma/common/alone_encoder.o \
	src/liblzma/common/block_buffer_encoder.o \
	src/liblzma/common/block_encoder.o \
	src/liblzma/common/block_header_encoder.o \
	src/liblzma/common/easy_buffer_encoder.o \
	src/liblzma/common/easy_encoder.o \
	src/liblzma/common/easy_encoder_memusage.o \
	src/liblzma/common/filter_buffer_encoder.o \
	src/liblzma/common/filter_encoder.o \
	src/liblzma/common/filter_flags_encoder.o \
	src/liblzma/common/index_encoder.o \
	src/liblzma/common/stream_buffer_encoder.o \
	src/liblzma/common/stream_encoder.o \
	src/liblzma/common/stream_flags_encoder.o \
	src/liblzma/common/vli_encoder.o \
	src/liblzma/common/alone_decoder.o \
	src/liblzma/common/auto_decoder.o \
	src/liblzma/common/block_buffer_decoder.o \
	src/liblzma/common/block_decoder.o \
	src/liblzma/common/block_header_decoder.o \
	src/liblzma/common/easy_decoder_memusage.o \
	src/liblzma/common/filter_buffer_decoder.o \
	src/liblzma/common/filter_decoder.o \
	src/liblzma/common/filter_flags_decoder.o \
	src/liblzma/common/index_decoder.o \
	src/liblzma/common/index_hash.o \
	src/liblzma/common/stream_buffer_decoder.o \
	src/liblzma/common/stream_decoder.o \
	src/liblzma/common/stream_flags_decoder.o \
	src/liblzma/common/vli_decoder.o \
	src/liblzma/check/check.o \
	src/liblzma/check/crc32_table.o \
	src/liblzma/check/crc32_fast.o \
	src/liblzma/check/crc64_table.o \
	src/liblzma/check/crc64_fast.o \
	src/liblzma/check/sha256.o \
	src/liblzma/rangecoder/price_table.o \
	src/liblzma/lz/lz_encoder.o \
	src/liblzma/lz/lz_encoder_mf.o \
	src/liblzma/lz/lz_decoder.o \
	src/liblzma/simple/simple_coder.o \
	src/liblzma/simple/simple_encoder.o \
	src/liblzma/simple/simple_decoder.o \
	src/liblzma/simple/x86.o \
	src/liblzma/simple/powerpc.o \
	src/liblzma/simple/ia64.o \
	src/liblzma/simple/arm.o \
	src/liblzma/simple/armthumb.o \
	src/liblzma/simple/sparc.o \
	src/liblzma/lzma/lzma_encoder.o \
	src/liblzma/lzma/lzma_encoder_presets.o \
	src/liblzma/lzma/lzma_encoder_optimum_fast.o \
	src/liblzma/lzma/lzma_encoder_optimum_normal.o \
	src/liblzma/lzma/fastpos_table.o \
	src/liblzma/lzma/lzma_decoder.o \
	src/liblzma/lzma/lzma2_encoder.o \
	src/liblzma/lzma/lzma2_decoder.o

LOCAL_CFLAGS = \
	-Isrc/liblzma/api \
	-Isrc/liblzma/common \
	-Isrc/liblzma/check \
	-Isrc/liblzma/lz \
	-Isrc/liblzma/rangecoder \
	-Isrc/liblzma/lzma \
	-Isrc/liblzma/delta \
	-Isrc/liblzma/simple \
	-I. -Isrc/common \
	-DHAVE_CONFIG_H -std=c99

<$mkbuild/mk.default

$LOBJ: config.h

config.h:QV:
	cp ../config.h config.h