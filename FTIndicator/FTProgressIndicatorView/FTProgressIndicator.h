//
//  FTProgressIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Defines

#define kFTProgressMaxWidth                         (240.f)
#define kFTProgressMargin_X                         (10.f)
#define kFTProgressMargin_Y                         (20.f)
#define kFTProgressImageSize                        (30.f)
#define kFTProgressImageToLabel                     (15.f)
#define kFTProgressCornerRadius                     (10.f)
#define kFTProgressDefaultAnimationDuration         (0.2f)
#define kFTProgressDefaultFont                      [UIFont systemFontOfSize:15]
#define kFTProgressDefaultTextColor                 [UIColor blackColor]
#define kFTProgressDefaultTextColor_ForDarkStyle    [UIColor whiteColor]

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