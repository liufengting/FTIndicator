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
 *  showNotificationWithImage
 *
 *  @param image   image
 *  @param title   title
 *  @param message message
 */
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

@end
