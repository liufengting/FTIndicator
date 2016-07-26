//
//  FTNotificationIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTNotificationIndicator : NSObject

@end

#define kFTNotificationMaxHeight            (200.f)
#define kFTNotificationTitleHeight          (24.f)
#define kFTNotificationMargin_X             (8.f)
#define kFTNotificationMargin_Y             (8.f)
#define kFTNotificationImageSize            (24.f)
#define kFTNotificationStatusBarHeight      (20.f)


@interface FTNotificationIndicatorView : UIVisualEffectView

-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

-(CGSize )getFrameForNotificationMessageLabelWithImage:(UIImage *)image message:(NSString *)notificationMessage;

-(CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage;

@end
