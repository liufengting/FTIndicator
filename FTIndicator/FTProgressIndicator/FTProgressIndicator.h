//
//  FTProgressIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
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
 *  dismiss
 */
+(void)dismiss;
/**
 *  setProgressIndicatorStyleToDefaultStyle
 */
+(void)setProgressIndicatorStyleToDefaultStyle;
/**
 *  setProgressIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+(void)setProgressIndicatorStyle:(UIBlurEffectStyle)style;

@end

#pragma FTProgressIndicatorView
/**
 *  FTProgressIndicatorView
 */
@interface FTProgressIndicatorView : UIVisualEffectView
/**
 *  showProgressWithType
 *
 *  @param type    FTProgressIndicatorMessageType
 *  @param message message
 *  @param style   style
 */
-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message style:(UIBlurEffectStyle)style;
/**
 *  getFrameForProgressViewWithMessage
 *
 *  @param progressMessage progressMessage
 *
 *  @return CGSize
 */
-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage;

@end