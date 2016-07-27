//
//  FTIndicator.h
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTToastIndicator.h"
#import "FTProgressIndicator.h"
#import "FTNotificationIndicator.h"

@interface FTIndicator : NSObject

+(void)showToastMessage:(NSString *)toastMessage;

+(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage;

+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message;

@end
