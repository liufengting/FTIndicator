//
//  FTToastIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FTToastIndicatorStyle) {
    FTToastIndicatorStyleLight,
    FTToastIndicatorStyleExtraLight,
    FTToastIndicatorStyleDark
};

@interface FTToastIndicator : NSObject

+(void)setToastIndicatorStyle:(FTToastIndicatorStyle)style;

+(void)showToastMessage:(NSString *)toastMessage;


@end


#define kFTToastMaxWidth            (kFTScreenWidth*0.7)
#define kFTToastMaxHeight           (100.f)
#define kFTToastMargin_X            (20.f)
#define kFTToastMargin_Y            (10.f)
#define kFTToastToBottom            (20.f)
#define kFTToastCornerRadius        (8.f)

@interface FTToastIndicatorView : UIVisualEffectView

-(void )showToastMessage:(NSString *)toastMessage;

-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage;

@end