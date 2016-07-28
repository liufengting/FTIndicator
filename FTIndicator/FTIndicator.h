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
+(void)setIndicatorStyleToDefaultStyle;

+(void)setIndicatorStyle:(UIBlurEffectStyle)style;

/**
 *  FTToastIndicator
 */
+(void)showToastMessage:(NSString *)toastMessage;

/**
 *  FTProgressIndicator
 */
+(void)showProgressWithmessage:(NSString *)message;

+(void)showInfoWithMessage:(NSString *)message;

+(void)showSuccessWithMessage:(NSString *)message;

+(void)showErrorWithMessage:(NSString *)message;

/**
 *  FTNotificationIndicator
 */
+(void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;

+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

@end
