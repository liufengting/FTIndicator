//
//  FTNotificationIndicator.h
//  FTIndicator
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - FTNotificationIndicator

typedef void (^FTNotificationTapHandler)(void);
typedef void (^FTNotificationCompletion)(void);

/**
 FTNotificationIndicator
 */
@interface FTNotificationIndicator : NSObject

/**
 setIndicatorStyleToDefaultStyle
 */
+ (void)setNotificationIndicatorStyleToDefaultStyle;
/**
 setIndicatorStyle

 @param style style
 */
+ (void)setNotificationIndicatorStyle:(UIBlurEffectStyle)style;
/**
 showNotificationWithTitle message

 @param title title
 @param message message
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message;
/**
 showNotificationWithTitle message tapHandler

 @param title title
 @param message message
 @param tapHandler tapHandler
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 showNotificationWithTitle message tapHandler completion

 @param title title
 @param message message
 @param tapHandler tapHandler
 @param completion completion
 */
+ (void)showNotificationWithTitle:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler completion:(FTNotificationCompletion)completion;
/**
 showNotificationWithImage title message

 @param image image
 @param title title
 @param message message
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;
/**
 showNotificationWithImage title message tapHandler

 @param image image
 @param title title
 @param message message
 @param tapHandler tapHandler
 */
+ (void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message tapHandler:(FTNotificationTapHandler)tapHandler;
/**
 showNotificationWithImage title message tapHandler completion


 @param image image
 @param title title
 @param message message
 @param tapHandler tapHandler
 @param completion completion
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
 dismiss
 */
+ (void)dismiss;


/**
 Default delay until dismiss notification

 @param time Delay in seconds
 */
+ (void)setDefaultDismissTime:(NSTimeInterval)time;


/**
 Default delay until dismiss notification

 @return Delay in seconds
 */
+ (NSTimeInterval)defaultDismissTime;

@end

#pragma mark - FTNotificationIndicatorView

/**
 FTNotificationIndicatorView
 */
@interface FTNotificationIndicatorView : UIVisualEffectView
/**
 showWithImage

 @param image image
 @param title title
 @param message message
 @param style style
 */
- (void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message style:(UIBlurEffectStyle)style;
/**
 getFrameForNotificationViewWithImage

 @param image image
 @param notificationMessage message
 @return CGSize
 */
- (CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage;

@end
