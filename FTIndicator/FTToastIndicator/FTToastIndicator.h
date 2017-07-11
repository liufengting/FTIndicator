//
//  FTToastIndicator.h
//  FTIndicator
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - FTToastIndicator
/**
 FTToastIndicator
 */
@interface FTToastIndicator : NSObject
/**
 setIndicatorStyleToDefaultStyle
 */
+ (void)setToastIndicatorStyleToDefaultStyle;
/**
 setIndicatorStyle

 @param style style
 */
+ (void)setToastIndicatorStyle:(UIBlurEffectStyle)style;
/**
 showToastMessage

 @param toastMessage toastMessage
 */
+ (void)showToastMessage:(NSString *)toastMessage;

/**
 dismiss
 */
+ (void)dismiss;

@end

#pragma mark - FTToastIndicatorView

/**
 FTToastIndicatorView
 */
@interface FTToastIndicatorView : UIVisualEffectView
/**
 showToastMessage

 @param toastMessage toastMessage
 @param style style
 */
- (void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style;
/**
 getFrameForToastViewWithMessage

 @param toastMessage toastMessage
 @return CGSize
 */
- (CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage;

@end
