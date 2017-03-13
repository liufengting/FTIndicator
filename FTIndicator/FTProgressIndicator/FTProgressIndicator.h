//
//  FTProgressIndicator.h
//  FTIndicator
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - FTProgressIndicatorMessageType
/**
 *  FTProgressIndicatorMessageType
 */
typedef NS_ENUM(NSUInteger, FTProgressIndicatorMessageType) {
    /**
     *  Info
     */
    FTProgressIndicatorMessageTypeInfo,
    /**
     *  Success
     */
    FTProgressIndicatorMessageTypeSuccess,
    /**
     *  Error
     */
    FTProgressIndicatorMessageTypeError,
    /**
     *  Progress
     */
    FTProgressIndicatorMessageTypeProgress
};

#pragma mark - FTProgressIndicator
/**
 *  FTProgressIndicator
 */
@interface FTProgressIndicator : NSObject

/**
 *  showProgressWithmessage
 *
 *  @param message message
 */
+ (void)showProgressWithmessage:(NSString *)message;

/**
 *  showProgressWithmessage userInteractionEnable
 *
 *  @param message               message
 *  @param userInteractionEnable userInteractionEnable
 */
+ (void)showProgressWithmessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable;

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
 *  dismiss
 */
+ (void)dismiss;

/**
 *  setProgressIndicatorStyleToDefaultStyle
 */
+ (void)setProgressIndicatorStyleToDefaultStyle;

/**
 *  setProgressIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+ (void)setProgressIndicatorStyle:(UIBlurEffectStyle)style;

@end

#pragma mark - FTProgressIndicatorView

/**
 *  FTProgressIndicatorView
 */
@interface FTProgressIndicatorView : UIVisualEffectView

/**
 *  userInteractionEnable, if allows user touches at view
 */
@property (assign, nonatomic) BOOL userInteractionEnable;

/**
 *  showProgressWithType
 *
 *  @param type                   type
 *  @param message                message
 *  @param image                  custom image
 *  @param style                  style
 *  @param userInteractionEnable userInteractionEnable
 */
- (void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message image:(UIImage *)image style:(UIBlurEffectStyle)style userInteractionEnable:(BOOL)userInteractionEnable;
/**
 *  getFrameForProgressViewWithMessage
 *
 *  @param progressMessage progressMessage
 *
 *  @return CGSize
 */
- (CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage;

@end
