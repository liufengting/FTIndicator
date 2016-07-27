//
//  FTNotificationIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFTNotificationMaxHeight            (200.f)
#define kFTNotificationTitleHeight          (24.f)
#define kFTNotificationMargin_X             (10.f)
#define kFTNotificationMargin_Y             (8.f)
#define kFTNotificationImageSize            (24.f)
#define kFTNotificationStatusBarHeight      (20.f)

@interface FTNotificationIndicator : NSObject



+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;



@end


@interface FTNotificationIndicatorView : UIVisualEffectView

-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

-(CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage;

@end
