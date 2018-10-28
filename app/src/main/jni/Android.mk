LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := jniHello
LOCAL_LDFLAGS := -Wl,--build-id
LOCAL_SRC_FILES := \
	/Users/wiserwong/androidPjt/JniDemo/app/src/main/jni/com_wiser_jnidemo_jni_JniUtil.cpp \libstdc++.a

LOCAL_C_INCLUDES += /Users/wiserwong/androidPjt/JniDemo/app/src/debug/jni
LOCAL_C_INCLUDES += /Users/wiserwong/androidPjt/JniDemo/app/src/main/jni

include $(BUILD_SHARED_LIBRARY)
