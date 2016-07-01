#!/bin/bash 

#export NDKRROOT=/home/suker/work/dev/android/android-ndk-r10e
#export PREBUILT=$NDKRROOT/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64
#export ARMV7ALIB=$PREBUILT/lib/gcc/arm-linux-androideabi/4.8/armv7-a

export NDKRROOT=/Users/zhoushuqiang/Desktop/suker/setup/android/android-ndk-r11b
export PREBUILT=$NDKRROOT/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
export ARMV7ALIB=$PREBUILT/lib/gcc/arm-linux-androideabi/4.9/armv7-a

export PLATFORM=$NDKRROOT/platforms/android-16/arch-arm/usr
export PATH=$PATH:$PREBUILT/bin

echo "suker-pwd:"
pwd

CROSS_PREFIX=$PREBUILT/bin/arm-linux-androideabi-
CPU=arm
OPTIMIZE_CFLAGS="-mfloat-abi=softfp -mfpu=vfpv3-d16 -marm -march=armv7-a -mthumb -D__thumb__"

#current dir is ffmpeg-2.4.2/

./configure --prefix=$PWD/build/armeabi-v7a\
 --arch=armv7-a  \
 --cpu=armv7-a   \
 --arch=arm      \
 --target-os=linux \
 --extra-cflags="-static -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -Wredundant-decls -I$PLATFORM/include -I./ -O3 -march=armv7-a -mfpu=neon -mfloat-abi=softfp"\
 --extra-ldflags="-L$PLATFORM/lib -nostdlib -L$ARMV7ALIB"\
 --extra-libs="-lc -lm -ldl -lgcc" \
 --enable-cross-compile \
 --cross-prefix="${CROSS_PREFIX}"  \
 --cc="${CROSS_PREFIX}gcc" \
 --ar="${CROSS_PREFIX}ar" \
 --ld="${CROSS_PREFIX}ld"  \
 --ranlib="${CROSS_PREFIX}ranlib" \
 --strip="${CROSS_PREFIX}strip" \
 --nm="${CROSS_PREFIX}nm" \
  --disable-everything \
  --disable-zlib --disable-bzlib \
  --disable-debug \
  --disable-shared \
  \
  --disable-programs \
  --disable-decoders \
  --disable-encoders \
  --disable-hwaccels \
  --disable-parsers \
  --disable-demuxers \
  --disable-filters \
  --disable-bsfs \
  --disable-indevs \
  --disable-outdevs \
  --disable-devices \
  --disable-avdevice \
  --disable-avfilter \
  --disable-avresample \
  --disable-swscale \
  --disable-swresample \
  --disable-postproc \
  \
  --enable-static \
  --enable-small \
  --enable-version3\
  \
  --enable-memalign-hack \
  --enable-pthreads  \
  --enable-protocol=ffrtmphttp \
  --enable-protocol=ffrtmpcrypt \
  --enable-protocol=rtmp \
  --enable-protocol=rtmpe \
  --enable-protocol=rtmps \
  --enable-protocol=rtmpt \
  --enable-protocol=rtmpte \
  --enable-protocol=rtmpts


make && make install

