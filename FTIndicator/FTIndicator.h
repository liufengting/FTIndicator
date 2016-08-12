//
//  FTIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTToastIndicator.h"
#import "FTProgressIndicator.h"
#import "FTNotificationIndicator.h"

#pragma mark - FTIndicator
/**
 *  FTIndicator
 */
@interface FTIndicator : NSObject

/**
 *  set Style
 */
#pragma mark - set theme style
/**
*  setIndicatorStyleToDefaultStyle
*/
+(void)setIndicatorStyleToDefaultStyle;
/**
 *  setIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+(void)setIndicatorStyle:(UIBlurEffectStyle)style;

/**
 *  FTToastIndicator
 */
#pragma mark - FTToastIndicator

/**
 *  showToastMessage
 *
 *  @param toastMessage NSString toastMessage
 */
+(void)showToastMessage:(NSString *)toastMessage;

/**
 *  dismissToast
 */
+(void)dismissToast;

/**
 *  FTProgressIndicator
 */
#pragma mark - FTProgressIndicator
/**
 *  showProgressWithmessage
 *
 *  @param message NSString message
 */
+(void)showProgressWithmessage:(NSString *)message;

/**
 *  showInfoWithMessage
 *
 *  @param message NSString message
 */
+(void)showInfoWithMessage:(NSString *)message;

/**
 *  showSuccessWithMessage
 *
 *  @param message NSString message
 */
+(void)showSuccessWithMessage:(NSString *)message;

/**
 *  showErrorWithMessage
 *
 *  @param message NSString message
 */
+(void)showErrorWithMessage:(NSString *)message;
/**
 *  dismissProgress
 */
+(void)dismissProgress;

/**
 *  FTNotificationIndicator
 */
#pragma mark - FTNotificationIndicator
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
 *  @param tapHandler tapHandler
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
 *  @param tapHandler tapHandler
 */
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 *  dismissNotification
 */
+(void)dismissNotification;

@end
