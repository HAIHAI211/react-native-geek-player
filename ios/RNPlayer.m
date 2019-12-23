//
//  VideoPlayer.m
//  GeekMathApp
//
//  Created by 甘瑞文 on 2019/8/23.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNPlayer.h"
#import "VideoPlayerViewController.h"
#import <SuperPlayer/SuperPlayer.h>

@interface VideoPlayer() <VideoPlayerVCDelegate>

@property (nonatomic, strong) VideoPlayerViewController *playerVC;

@end

@implementation VideoPlayer

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(play:(NSString *)url) {
  SuperPlayerModel *playerModel = [[SuperPlayerModel alloc] init];
//  SuperPlayerVideoId *videoId = [[SuperPlayerVideoId alloc] init];
  //设置播放信息
//  videoId.appId = 1257124244;  //AppId
//  videoId.fileId = fileId;  //视频 FileId
//  playerModel.videoId = videoId;
  playerModel.videoURL = url;
  self.playerVC = [VideoPlayerViewController shareInstance];
  self.playerVC.delegate = self;
  self.playerVC.model = playerModel;

  dispatch_sync(dispatch_get_main_queue(), ^{
    UIViewController *rootVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    [rootVC presentViewController:self.playerVC animated:YES completion:nil];
  });
}

#pragma mark - VideoPlayerVCDelegate

- (void)superPlayerDidStart {

}

- (void)superPlayerDidEnd {

}

-(void)superPlayerErrCode:(int)code errMessage:(NSString *)why {

}

@end
