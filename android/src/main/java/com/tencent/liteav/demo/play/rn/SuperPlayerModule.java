package com.tencent.liteav.demo.play.rn;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.PopupWindow;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tencent.liteav.demo.play.R;
import com.tencent.liteav.demo.play.SuperPlayerModel;
import com.tencent.liteav.demo.play.SuperPlayerView;



public class SuperPlayerModule extends ReactContextBaseJavaModule {

    private ReactApplicationContext mContext;
    private View contentView;
    private SuperPlayerView superPlayerView;
    private PopupWindow popupWindow;

    public SuperPlayerModule(ReactApplicationContext context) {
        super(context);
        this.mContext = context;
        //this.contentView = LayoutInflater.from(context).inflate(R.layout.video_player_modal, null, false);
        //this.superPlayerView = this.contentView.findViewById(R.id.super_player_view);
        //this.popupWindow = new PopupWindow(this.contentView, WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
        //this.popupWindow.setBackgroundDrawable(new ColorDrawable());
    }

    @Override
    public String getName() {
        return "SuperPlayerModule";
    }

    @ReactMethod
    public void play(String url){
        //this.popupWindow.showAtLocation(getCurrentActivity().getWindow().getDecorView(), Gravity.CENTER, 0, 0);
//        // SuperPlayerView mSuperPlayerView = findViewById();
//        SuperPlayerModel model = new SuperPlayerModel();
//        model.url = url;
//        //this.superPlayerView.playWithModel(model);

        Intent intent = new Intent(getCurrentActivity(), SuperPlayerActivity.class);
        intent.putExtra("url", url);
        getCurrentActivity().startActivity(intent);
    }
}
