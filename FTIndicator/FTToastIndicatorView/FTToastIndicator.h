//
//  FTToastIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTToastIndicator : NSObject

+(void)setToastIndicatorStyleToDefaultStyle;

+(void)setToastIndicatorStyle:(UIBlurEffectStyle)style;

+(void)showToastMessage:(NSString *)toastMessage;

+(void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style;

@end


#define kFTToastMaxWidth            (kFTScreenWidth*0.7)
#define kFTToastMaxHeight           (100.f)
#define kFTToastMargin_X            (20.f)
#define kFTToastMargin_Y            (10.f)
#define kFTToastToBottom            (20.f)
#define kFTToastCornerRadius        (8.f)
#define kFTToastDefaultFont         [UIFont systemFontOfSize:15]
#define kFTToastDefaultTextColor    [UIColor blackColor]
#define kFTToastDefaultTextColor_ForDarkStyle   [UIColor whiteColor]


@interface FTToastIndicatorView : UIVisualEffectView

-(void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style;

-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage;

@end