package com.tencent.liteav.demo.play.rn;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;

import com.tencent.liteav.demo.play.R;
import com.tencent.liteav.demo.play.SuperPlayerConst;
import com.tencent.liteav.demo.play.SuperPlayerModel;
import com.tencent.liteav.demo.play.SuperPlayerView;

public class SuperPlayerActivity extends AppCompatActivity {

    private SuperPlayerView superPlayerView;

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (newConfig.orientation == Configuration.ORIENTATION_PORTRAIT) {
            finish();
        }
    }

    @Override
    public void onBackPressed() {
        //super.onBackPressed();
        superPlayerView.resetPlayer();
        finish();
    }

    /**
     * 旋转屏幕方向
     *
     * @param orientation
     */
    private void rotateScreenOrientation(int orientation) {
        switch (orientation) {
            case SuperPlayerConst.ORIENTATION_LANDSCAPE:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
                break;
            case SuperPlayerConst.ORIENTATION_PORTRAIT:
                setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                break;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Intent intent = getIntent();
        String url = intent.getStringExtra("url");

        setContentView(R.layout.activity_super_player);
        superPlayerView = findViewById(R.id.super_player_view);
        superPlayerView.setPlayerViewCallback(new SuperPlayerView.OnSuperPlayerViewCallback() {

            @Override
            public void onStartFullScreenPlay() {

            }

            @Override
            public void onStopFullScreenPlay() {

            }

            @Override
            public void onClickFloatCloseBtn() {

            }

            @Override
            public void onStartFloatWindowPlay() {

            }

            @Override
            public void onClickSmallReturnBtn() {
                rotateScreenOrientation(SuperPlayerConst.ORIENTATION_PORTRAIT);
                //finish();
            }
        });
        superPlayerView.setBackgroundColor(Color.parseColor("#000000"));
        SuperPlayerModel model = new SuperPlayerModel();
        model.url = url;
        model.title = "视频播放";
        superPlayerView.playWithModel(model);
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
        superPlayerView.resetPlayer();
    }
}
