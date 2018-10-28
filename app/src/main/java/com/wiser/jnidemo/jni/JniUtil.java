package com.wiser.jnidemo.jni;

public class JniUtil {

    static {
        System.loadLibrary("jniHello");
    }

    public native String textStr();

}
