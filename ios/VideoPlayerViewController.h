//
//  VideoPlayerViewController.h
//  GeekMathApp
//
//  Created by 甘瑞文 on 2019/8/23.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>
#import <SuperPlayer/SuperPlayer.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VideoPlayerVCDelegate <NSObject>

/// 播放开始通知
- (void)superPlayerDidStart;
/// 播放结束通知
- (void)superPlayerDidEnd;
/// 播放错误通知
- (void)superPlayerErrCode:(int)code errMessage:(NSString *)why;

@end

@interface VideoPlayerViewController : UIViewController

@property (nonatomic, assign) id<VideoPlayerVCDelegate> delegate;

@property (nonatomic, strong) SuperPlayerModel *model;

- (void)playWithModel:(SuperPlayerModel *)playerModel;

+ (VideoPlayerViewController *)shareInstance;

@end

NS_ASSUME_NONNULL_END
