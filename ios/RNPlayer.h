//
//  VideoPlayer.h
//  GeekMathApp
//
//  Created by 甘瑞文 on 2019/8/23.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject <RCTBridgeModule>

- (void)play:(NSString *)fileId;

@end

NS_ASSUME_NONNULL_END
