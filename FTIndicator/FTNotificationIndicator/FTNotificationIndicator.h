//
//  FTNotificationIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - FTNotificationIndicator
typedef void (^FTNotificationTapHandler)(void);

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
 *  showNotificationWithTitle
 *
 *  @param title   title
 *  @param message message
 *  @param FTTapNotificationHandler tapHandler
 */
+(void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 *  showNotificationWithImage
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 */
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;
/**
 *  showNotificationWithImage
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 *  @param FTTapNotificationHandler tapHandler
 */
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
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
