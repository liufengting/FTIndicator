//
//  FTNotificationIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Defines

#define kFTNotificationMaxHeight                        (200.f)
#define kFTNotificationTitleHeight                      (24.f)
#define kFTNotificationMargin_X                         (10.f)
#define kFTNotificationMargin_Y                         (10.f)
#define kFTNotificationImageSize                        (30.f)
#define kFTNotificationStatusBarHeight                  (20.f)
#define kFTNotificationDefaultAnimationDuration         (0.2f)
#define kFTNotificationDefaultTitleFont                 [UIFont boldSystemFontOfSize:15]
#define kFTNotificationDefaultMessageFont               [UIFont systemFontOfSize:13]
#define kFTNotificationDefaultTextColor                 [UIColor blackColor]
#define kFTNotificationDefaultTextColor_ForDarkStyle    [UIColor whiteColor]

#pragma mark - FTNotificationIndicator
/**
 *  FTNotificationIndicator
 */
@interface FTNotificationIndicator : NSObject
/**
 *  setIndicatorStyleToDefaultStyle
 */
+(void)setNotificationIndicatorStyleToDefaultStyle;
/**
 *  setIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+(void)setNotificationIndicatorStyle:(UIBlurEffectStyle)style;
/**
 *  showNotificationWithTitle
 *
 *  @param title   title
 *  @param message message
 */
+(void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;
/**
 *  showNotificationWithImage
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 */
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;
/**
 *  dismiss
 */
+(void)dismiss;

@end

#pragma mark - FTNotificationIndicatorView
/**
 *  FTNotificationIndicatorView
 */
@interface FTNotificationIndicatorView : UIVisualEffectView
/**
 *  showWithImage
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 *  @param style   style
 */
-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message style:(UIBlurEffectStyle)style;
/**
 *  getFrameForNotificationViewWithImage
 *
 *  @param image               image
 *  @param notificationMessage message
 *
 *  @return CGSize
 */
-(CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage;

@end
