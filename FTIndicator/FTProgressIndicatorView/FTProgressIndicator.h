//
//  FTProgressIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFTProgressMaxWidth                         (kFTScreenWidth*0.6)
#define kFTProgressMargin_X                         (10.f)
#define kFTProgressMargin_Y                         (20.f)
#define kFTProgressImageSize                        (30.f)
#define kFTProgressImageToLabel                     (15.f)
#define kFTProgressCornerRadius                     (10.f)
#define kFTProgressDefaultAnimationDuration         (0.2f)
#define kFTProgressDefaultFont                      [UIFont systemFontOfSize:15]
#define kFTProgressDefaultTextColor                 [UIColor blackColor]
#define kFTProgressDefaultTextColor_ForDarkStyle    [UIColor whiteColor]

typedef NS_ENUM(NSUInteger, FTProgressIndicatorMessageType) {
    FTProgressIndicatorMessageTypeInfo,
    FTProgressIndicatorMessageTypeSuccess,
    FTProgressIndicatorMessageTypeError,
    FTProgressIndicatorMessageTypeProgress
};

@interface FTProgressIndicator : NSObject

+(void)showProgressWithmessage:(NSString *)message;

+(void)showInfoWithMessage:(NSString *)message;

+(void)showSuccessWithMessage:(NSString *)message;

+(void)showErrorWithMessage:(NSString *)message;

+(void)setProgressIndicatorStyleToDefaultStyle;

+(void)setProgressIndicatorStyle:(UIBlurEffectStyle)style;

@end


@interface FTProgressIndicatorView : UIVisualEffectView

-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message style:(UIBlurEffectStyle)style;

-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage;

@end