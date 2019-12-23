package com.tencent.liteav.demo.play.rn;

import android.widget.TextView;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

public class TextViewManager extends SimpleViewManager {

    private ThemedReactContext mContext;

    @Override
    public String getName() {
        return "AndroidTextView";
    }

    @Override
    protected TextView createViewInstance(ThemedReactContext reactContext){
        this.mContext = reactContext;
        TextView textView = new TextView(reactContext);
        return textView;
    }

    @ReactProp(name="title")
    public void setTitle(final TextView tv, String title){
        tv.setText(title);
    }

}
