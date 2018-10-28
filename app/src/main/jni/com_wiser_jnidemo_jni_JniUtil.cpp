
#include "com_wiser_jnidemo_jni_JniUtil.h"

JNIEXPORT jstring JNICALL Java_com_wiser_jnidemo_jni_JniUtil_textStr
  (JNIEnv *env, jobject obj)
  {
    return env->NewStringUTF("你好");
  }

