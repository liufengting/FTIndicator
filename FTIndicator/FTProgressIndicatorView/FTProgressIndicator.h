//
//  FTProgressIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FTProgressIndicator : NSObject


+(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage;

@end

#define kFTProgressMaxWidth             (kFTScreenWidth*0.6)
#define kFTProgressMargin_X             (10.f)
#define kFTProgressMargin_Y             (20.f)
#define kFTProgressImageSize            (30.f)
#define kFTProgressImageToLabel         (15.f)
#define kFTProgressCornerRadius         (10.f)

@interface FTProgressIndicatorView : UIVisualEffectView

-(void)showProgressWithImage:(UIImage *)image message:(NSString *)message;

-(CGSize )getFrameForProgressMessageLabelWithMessage:(NSString *)progressMessage;

-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage;

@end