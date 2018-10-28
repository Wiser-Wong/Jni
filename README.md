# Jni
第一个Jni

# 需要先下载NDK
设置中Android SDK 标签下 SDK Tools标签下 勾选NDK 然后下载
# 配置NDK路径
在local.properties 文件下 加上ndk.dir=你的NDK路径
# 新建Jni 工具类
新建类例如JniUtil
    static {
        System.loadLibrary("jniHello");//jniHello是你的生成库名称
    }

    public native String textStr();
    ...
然后构建项目 make project 然后会生成app/build/intermediates/classes/debug com.wiser.jnidemo.jni.JniUtil.class类
# build.gradle配置ndk
    defaultConfig {
        ...
        ndk {
            moduleName "jniHello"//是你的生成库名称 与JniUtil类中的库名一致
        }
    }
# 创建头文件.h
通过终端进入到cd /Users/wiserwong/androidPjt/JniDemo/app/build/intermediates/classes/debug debug目录下然后通过命令行
javah com.wiser.jnidemo.jni.JniUtil命令行生成.h头文件com_wiser_jnidemo_jni_JniUtil.h文件
# 创建jni目录
## 1、在main目录下创建jni目录,然后把生成的.h文件拷贝过去
## 2、然后创建.cpp文件 导入.h头文件然后执行java底层方法,返回类型是String jni中使用jstring, 方法名就是java+包名+类名+方法名
#include "com_wiser_jnidemo_jni_JniUtil.h"
JNIEXPORT jstring JNICALL Java_com_wiser_jnidemo_jni_JniUtil_textStr
  (JNIEnv *env, jobject obj)
  {
    return env->NewStringUTF("你好");
  }
## 3、构建make project 会生成app/build/intermediates/ndk目录然后 生成Android.mk文件,将Android.mk文件拷贝到jni目录 删除ndk文件夹
## 4、修改Android.mk文件 在LOCAL_SRC_FILES=.cpp路径\libstdc++.a
## 5、在build.gradle文件中加入
    externalNativeBuild {
        ndkBuild {
            path "src/main/jni/Android.mk"
        }
    }
    然后sync now 然后make project构建项目 然后会生成app/build/intermediates/ndkBuild目录 该目录下会生成.so文件库
# 调用jni
在Activity 中直接就可以调用JniUtil中的native方法了.
