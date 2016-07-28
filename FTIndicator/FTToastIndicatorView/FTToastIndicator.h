//
//  FTToastIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFTToastMaxWidth            (kFTScreenWidth*0.7)
#define kFTToastMaxHeight           (100.f)
#define kFTToastMargin_X            (20.f)
#define kFTToastMargin_Y            (10.f)
#define kFTToastToBottom            (20.f)
#define kFTToastCornerRadius        (8.f)
#define kFTToastDefaultAnimationDuration         (0.2f)
#define kFTToastDefaultFont         [UIFont systemFontOfSize:15]
#define kFTToastDefaultTextColor    [UIColor blackColor]
#define kFTToastDefaultTextColor_ForDarkStyle   [UIColor whiteColor]

@interface FTToastIndicator : NSObject

+(void)setToastIndicatorStyleToDefaultStyle;

+(void)setToastIndicatorStyle:(UIBlurEffectStyle)style;

+(void)showToastMessage:(NSString *)toastMessage;

@end

@interface FTToastIndicatorView : UIVisualEffectView

-(void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style;

-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage;

@end