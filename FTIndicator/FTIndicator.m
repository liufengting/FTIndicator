//
//  FTIndicator.m
//  FTIndicator
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTIndicator.h"

@interface FTIndicator ()

@end

@implementation FTIndicator

+ (void)setIndicatorStyleToDefaultStyle
{
    [self setIndicatorStyle:UIBlurEffectStyleLight];
}

+ (void)setIndicatorStyle:(UIBlurEffectStyle)style
{
    [FTToastIndicator setToastIndicatorStyle:style];
    [FTProgressIndicator setProgressIndicatorStyle:style];
    [FTNotificationIndicator setNotificationIndicatorStyle:style];
}

#pragma mark - FTToastIndicator
/**
 *  FTToastIndicator
 */
+ (void)showToastMessage:(NSString *)toastMessage
{
    [FTToastIndicator showToastMessage:toastMessage];
}

+ (void)dismissToast
{
    [FTToastIndicator dismiss];
}


#pragma mark - FTProgressIndicator
/**
 *  FTProgressIndicator
 */
+ (void)showProgressWithMessage:(NSString *)message
{
    [self showProgressWithMessage:message userInteractionEnable:YES];
}
+ (void)showProgressWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [FTProgressIndicator showProgressWithMessage:message userInteractionEnable:userInteractionEnable];
}


+ (void)showInfoWithMessage:(NSString *)message
{
    [self showInfoWithMessage:message image:nil userInteractionEnable:YES];
}
+ (void)showInfoWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [self showInfoWithMessage:message image:nil userInteractionEnable:userInteractionEnable];
}
+ (void)showInfoWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable
{
    [FTProgressIndicator showInfoWithMessage:message image:image userInteractionEnable:userInteractionEnable];
}


+ (void)showSuccessWithMessage:(NSString *)message
{
    [self showSuccessWithMessage:message image:nil userInteractionEnable:YES];
}
+ (void)showSuccessWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [self showSuccessWithMessage:message image:nil userInteractionEnable:userInteractionEnable];
}
+ (void)showSuccessWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable
{
    [FTProgressIndicator showSuccessWithMessage:message image:image userInteractionEnable:userInteractionEnable];
}


+ (void)showErrorWithMessage:(NSString *)message
{
    [self showErrorWithMessage:message image:nil userInteractionEnable:YES];
}
+ (void)showErrorWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [self showErrorWithMessage:message image:nil userInteractionEnable:userInteractionEnable];
}
+ (void)showErrorWithMessage:(NSString *)message image:(UIImage *)image userInteractionEnable:(BOOL)userInteractionEnable
{
    [FTProgressIndicator showErrorWithMessage:message image:image userInteractionEnable:userInteractionEnable];
}


+ (void)dismissProgress
{
    [FTProgressIndicator dismiss];
}

#pragma mark - FTNotificationIndicator
/**
 *  FTNotificationIndicator
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message
{
    [self showNotificationWithImage:nil title:title message:message autoDismiss:YES tapHandler:nil completion:nil];
}

+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler
{
    [self showNotificationWithImage:nil title:title message:message autoDismiss:YES tapHandler:tapHandler completion:nil];
}

+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion
{
    [self showNotificationWithImage:nil title:title message:message autoDismiss:YES tapHandler:tapHandler completion:completion];
}

+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    [self showNotificationWithImage:image title:title message:message autoDismiss:YES tapHandler:nil completion:nil];
}

+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler
{
    [self showNotificationWithImage:image title:title message:message autoDismiss:YES tapHandler:tapHandler completion:nil];
}

+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion
{
    [self showNotificationWithImage:image title:title message:message autoDismiss:YES tapHandler:tapHandler completion:completion];
}

+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message autoDismiss:(BOOL)autoDismiss tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion
{
    [FTNotificationIndicator showNotificationWithImage:image title:title message:message autoDismiss:autoDismiss tapHandler:tapHandler completion:completion];
}

+ (void)dismissNotification
{
    [FTNotificationIndicator dismiss];
}

@end
