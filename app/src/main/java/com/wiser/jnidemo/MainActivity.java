package com.wiser.jnidemo;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

import com.wiser.jnidemo.jni.JniUtil;

public class MainActivity extends Activity {

    TextView textView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = findViewById(R.id.test);
        textView.setText(new JniUtil().textStr());
    }
}
