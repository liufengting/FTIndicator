//
//  FTToastIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Defines

#define kFTToastMaxWidth                        (kFTScreenWidth*0.7)
#define kFTToastMaxHeight                       (100.f)
#define kFTToastMargin_X                        (20.f)
#define kFTToastMargin_Y                        (10.f)
#define kFTToastToBottom                        (20.f)
#define kFTToastCornerRadius                    (8.f)
#define kFTToastDefaultAnimationDuration        (0.2f)
#define kFTToastDefaultFont                     [UIFont systemFontOfSize:15]
#define kFTToastDefaultTextColor                [UIColor blackColor]
#define kFTToastDefaultTextColor_ForDarkStyle   [UIColor whiteColor]

#pragma mark - FTToastIndicator
/**
 *  FTToastIndicator
 */

@interface FTToastIndicator : NSObject
/**
 *  setIndicatorStyleToDefaultStyle
 */
+(void)setToastIndicatorStyleToDefaultStyle;
/**
 *  setIndicatorStyle
 *
 *  @param style UIBlurEffectStyle style
 */
+(void)setToastIndicatorStyle:(UIBlurEffectStyle)style;
/**
 *  showToastMessage
 *
 *  @param toastMessage NSString toastMessage
 */
+(void)showToastMessage:(NSString *)toastMessage;
/**
 *  dismiss
 */
+(void)dismiss;

@end

#pragma mark - FTToastIndicatorView
/**
 *  FTToastIndicatorView
 */
@interface FTToastIndicatorView : UIVisualEffectView
/**
 *  showToastMessage
 *
 *  @param toastMessage toastMessage
 *  @param style        style
 */
-(void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style;
/**
 *  getFrameForToastViewWithMessage
 *
 *  @param toastMessage toastMessage
 *
 *  @return CGSize
 */
-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage;

@end