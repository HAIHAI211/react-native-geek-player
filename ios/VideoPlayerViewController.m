//
//  VideoPlayerViewController.m
//  GeekMathApp
//
//  Created by 甘瑞文 on 2019/8/23.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "VideoPlayerViewController.h"
#import <SuperPlayer/SuperPlayer.h>
#import "Masonry.h"

@interface VideoPlayerViewController () <SuperPlayerDelegate>

@property (nonatomic, strong) SuperPlayerView *playerView;

/** 播放器View的父视图*/
@property (nonatomic) UIView *playerFatherView;

@property (nonatomic, strong) UIView *navView;

@end

@implementation VideoPlayerViewController

+ (VideoPlayerViewController *)shareInstance {
    static VideoPlayerViewController * s_instance_dj_singleton = nil ;
    if (s_instance_dj_singleton == nil) {
      s_instance_dj_singleton = [[VideoPlayerViewController alloc] init];
      s_instance_dj_singleton.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return (VideoPlayerViewController *)s_instance_dj_singleton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
  self.navView = [[UIView alloc] init];
  if ([self isIPhoneXSeries]) {
    self.navView.frame = CGRectMake(0, 0, 150, 64 + 24);
  } else {
    self.navView.frame = CGRectMake(0, 0, 150, 64);
  }
  [self.view addSubview:self.navView];
  
  UILabel *titleView = [[UILabel alloc] init];
  titleView.text = @"视频播放";
  titleView.font = [UIFont boldSystemFontOfSize:17];
  titleView.textAlignment = NSTextAlignmentCenter;
  titleView.backgroundColor = [UIColor whiteColor];
  titleView.textColor = [UIColor blackColor];
  if ([self isIPhoneXSeries]) {
    titleView.bounds = CGRectMake(0, 0, 150, 64 + 24);
    titleView.center = CGPointMake(ScreenWidth / 2, 60);
  } else {
    titleView.bounds = CGRectMake(0, 0, 150, 64);
    titleView.center = CGPointMake(ScreenWidth / 2, 64 / 2);
  }
  
  [self.navView addSubview:titleView];
  
  UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
  [close setTitle:@"关闭" forState:UIControlStateNormal];
  close.titleLabel.font = [UIFont systemFontOfSize:13];
  [close setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  if ([self isIPhoneXSeries]) {
    close.frame = CGRectMake(10, 24, 40, 64);
  } else {
    close.frame = CGRectMake(10, 0, 40, 64);
  }
  [close addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
  [self.navView addSubview:close];
  
    self.playerFatherView = [[UIView alloc] init];
    self.playerFatherView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.playerFatherView];
    [self.playerFatherView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if (@available(iOS 11.0, *)) {
//          make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
//        } else {
//          make.top.mas_equalTo(20+self.navigationController.navigationBar.bounds.size.height);
//        }
        make.top.equalTo(self.navView.mas_bottom);
        make.leading.trailing.mas_equalTo(0);
        // 这里宽高比16：9,可自定义宽高比
        make.height.mas_equalTo(self.playerFatherView.mas_width).multipliedBy(9.0f/16.0f);
    }];
  
    self.playerView.fatherView = self.playerFatherView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.playerView.autoPlay = NO;
    [self.playerView playWithModel:self.model];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self.playerView resetPlayer];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playWithModel:(SuperPlayerModel *)playerModel {
  
    [self.playerView playWithModel:playerModel];
}

/// 播放开始通知
- (void)superPlayerDidStart:(SuperPlayerView *)player {
    NSLog(@"播放开始");
    [self.delegate superPlayerDidStart];
}

/// 播放结束通知
- (void)superPlayerDidEnd:(SuperPlayerView *)player {
    NSLog(@"播放结束");
    [self.delegate superPlayerDidEnd];
}

/// 播放错误通知
- (void)superPlayerError:(SuperPlayerView *)player errCode:(int)code errMessage:(NSString *)why {
    NSLog(@"播放出错:%@", why);
    [self.delegate superPlayerErrCode:code errMessage:why];
}

- (BOOL)isIPhoneXSeries {
  BOOL iPhoneXSeries = NO;
  if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
    return iPhoneXSeries;
  }
  
  if (@available(iOS 11.0, *)) {
    UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
    if (mainWindow.safeAreaInsets.bottom > 0.0) {
      iPhoneXSeries = YES;
    }
  }
  return iPhoneXSeries;
}

#pragma mark - getter

- (SuperPlayerView *)playerView
{
  if (!_playerView) {
    _playerView = [[SuperPlayerView alloc] init];
    _playerView.delegate = self;
  }
  return _playerView;
}

@end
