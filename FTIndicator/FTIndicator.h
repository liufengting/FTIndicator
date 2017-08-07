//
//  FTIndicator.h
//  FTIndicator
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
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
+ (void)setIndicatorStyleToDefaultStyle;
/**
 *  setIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+ (void)setIndicatorStyle:(UIBlurEffectStyle)style;

/**
 *  FTToastIndicator
 */
#pragma mark - FTToastIndicator

/**
 *  showToastMessage
 *
 *  @param toastMessage NSString toastMessage
 */
+ (void)showToastMessage:(NSString *)toastMessage;

/**
 *  dismissToast
 */
+ (void)dismissToast;

/**
 *  FTProgressIndicator
 */
#pragma mark - FTProgressIndicator
/**
 *  showProgressWithMessage
 *
 *  @param message message
 */
+ (void)showProgressWithMessage:(NSString *)message;

/**
 *  showProgressWithMessage userInteractionEnable
 *
 *  @param message               message
 *  @param userInteractionEnable userInteractionEnable
 */
+ (void)showProgressWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable;

/**
 *  showInfoWithMessage
 *
 *  @param message NSString message
 */
+ (void)showInfoWithMessage:(NSString *)message;

/**
 *  showInfoWithMessage userInteractionEnable
 *
 *  @param message               message
 *  @param userInteractionEnable userInteractionEnable
 */
+ (void)showInfoWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable;

/**
 showInfoWithMessage image userInteractionEnable
 
 @param message message
 @param image image
 @param userInteractionEnable userInteractionEnable
 */
+ (void)showInfoWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable;

/**
 *  showSuccessWithMessage
 *
 *  @param message NSString message
 */
+ (void)showSuccessWithMessage:(NSString *)message;

/**
 *  showSuccessWithMessage userInteractionEnable
 *
 *  @param message               message
 *  @param userInteractionEnable userInteractionEnable
 */
+ (void)showSuccessWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable;

/**
 showSuccessWithMessage image userInteractionEnable
 
 @param message message
 @param image image
 @param userInteractionEnable userInteractionEnable
 */
+ (void)showSuccessWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable;

/**
 *  showErrorWithMessage
 *
 *  @param message NSString message
 */
+ (void)showErrorWithMessage:(NSString *)message;

/**
 *  showErrorWithMessage userInteractionEnable
 *
 *  @param message               message
 *  @param userInteractionEnable userInteractionEnable
 */
+ (void)showErrorWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable;

/**
 showErrorWithMessage image userInteractionEnable
 
 @param message message
 @param image image
 @param userInteractionEnable userInteractionEnable
 */
+ (void)showErrorWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable;

/**
 *  dismissProgress
 */
+ (void)dismissProgress;

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
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;
/**
 *  showNotificationWithTitle message tapHandler
 *
 *  @param title      title
 *  @param message    message
 *  @param tapHandler tapHandler
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 *  showNotificationWithTitle message tapHandler completion
 *
 *  @param title   title
 *  @param message message
 *  @param tapHandler tapHandler
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion;
/**
 *  showNotificationWithImage title message
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;
/**
 *  showNotificationWithImage title message tapHandler
 *
 *  @param image      image
 *  @param title      title
 *  @param message    message
 *  @param tapHandler tapHandler
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 *  showNotificationWithImage title message tapHandler completion
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 *  @param tapHandler tapHandler
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion;
/**
 showNotificationWithImage title message autoDismiss tapHandler completion
 
 !!!!!!!!!  Only this method suports not dismiss automatically, user has to tap or swipe to dismiss.
 
 @param image image
 @param title title
 @param message message
 @param autoDismiss autoDismiss
 @param tapHandler tapHandler
 @param completion completion
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message autoDismiss:(BOOL)autoDismiss tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion;
/**
 *  dismissNotification
 */
+ (void)dismissNotification;

@end
