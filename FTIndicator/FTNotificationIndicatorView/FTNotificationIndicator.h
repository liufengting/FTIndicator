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
#define kFTNotificationMargin_Y             (10.f)
#define kFTNotificationImageSize            (30.f)
#define kFTNotificationStatusBarHeight      (20.f)
#define kFTNotificationDefaultAnimationDuration         (0.2f)
#define kFTNotificationDefaultTitleFont         [UIFont boldSystemFontOfSize:15]
#define kFTNotificationDefaultMessageFont   [UIFont systemFontOfSize:13]
#define kFTNotificationDefaultTextColor    [UIColor blackColor]
#define kFTNotificationDefaultTextColor_ForDarkStyle   [UIColor whiteColor]


@interface FTNotificationIndicator : NSObject

+(void)setNotificationIndicatorStyleToDefaultStyle;

+(void)setNotificationIndicatorStyle:(UIBlurEffectStyle)style;

+(void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;

+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

@end


@interface FTNotificationIndicatorView : UIVisualEffectView

-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message style:(UIBlurEffectStyle)style;

-(CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage;

@end
