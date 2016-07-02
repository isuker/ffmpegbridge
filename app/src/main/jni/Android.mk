#
# Makefile to build the libffmpegbridge.so library.
#
# Copyright (c) 2014, cine.io. All rights reserved.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ffmpegbridge
LOCAL_SRC_FILES := ffmpegbridge.c ffmpegbridge_context.c logdump.c
LOCAL_CFLAGS := -I$(LOCAL_PATH)/include -I$(LOCAL_PATH)/../prebuilt/armeabi-v7a/include
LOCAL_LDLIBS += -llog
LOCAL_LDLIBS += -L$(LOCAL_PATH)/../prebuilt/armeabi-v7a/lib
LOCAL_LDLIBS += -lavformat  -lavcodec -lavutil
#LOCAL_LDLIBS += -lavformat  -lavcodec -lswresample -lavutil
#LOCAL_LDLIBS += -lcrypto -lssl -lrtmp-1 -lavcodec-55 -lavdevice-55 -lavfilter-4 -lavformat-55 -lavutil-52 -lswresample-0 -lswscale-2

include $(BUILD_SHARED_LIBRARY)
