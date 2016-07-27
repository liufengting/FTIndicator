//
//  FTIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTIndicator.h"


@interface FTIndicator ()


@end


@implementation FTIndicator

+(FTIndicator *)sharedInstance
{
    static FTIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTIndicator alloc] init];
    });
    return shared;
}

+(void)showToastMessage:(NSString *)toastMessage
{
    [FTToastIndicator showToastMessage:toastMessage];
}

+(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage
{
    [FTProgressIndicator showProgressWithImage:image message:progressMessage];
}

+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    [FTNotificationIndicator showNotificationWithImage:image title:title message:message];
}


//
//-(void)showToastMessage:(NSString *)toastMessage
//{
//    self.toastView.alpha = 1;
//    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
//
//    CGSize toastSize = [self.toastView getFrameForToastViewWithMessage:toastMessage];
//    
//    [self.toastView setFrame:CGRectMake((kFTScreenWidth - toastSize.width)/2, kFTScreenHeight - kFTToastToBottom - toastSize.height, toastSize.width, toastSize.height)];
//    [self.toastView showToastMessage:toastMessage];
//    
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.toastView];
//    
//    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
//
//    
//    [UIView animateWithDuration:0.2
//                          delay:0
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0.5
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         
//                         self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
//
//                     } completion:^(BOOL finished) {
//                         if(finished){
//                             [self prepareForDismissingToastViewWithMessage:toastMessage];
//                         }
//                     }];
//    
//}
//-(void)prepareForDismissingToastViewWithMessage:(NSString *)toastMessage
//{
//    CGFloat it = toastMessage.length * 0.08;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.2
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{
//                             
//                             self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
//                             self.toastView.alpha = 0;
//                             
//                         } completion:^(BOOL finished) {
//                             if(finished){
//                                 
//                             }
//                         }];
//    });
//}
//
//
//-(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage
//{
//    self.progressView.alpha = 1;
//    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
//    
//    CGSize progressSize = [self.progressView getFrameForProgressViewWithMessage:progressMessage];
//    
//    [self.progressView setFrame:CGRectMake((kFTScreenWidth - progressSize.width)/2, (kFTScreenHeight - progressSize.height)/2, progressSize.width, progressSize.height)];
//    [self.progressView showProgressWithImage:image message:progressMessage];
//    
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.progressView];
//    
//    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
//    
//    
//    [UIView animateWithDuration:0.2
//                          delay:0
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0.5
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         
//                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
//                         
//                     } completion:^(BOOL finished) {
//                         if(finished){
//                             [self prepareForDismissingProgressViewWithMessage:progressMessage];
//                         }
//                     }];
//    
//}
//-(void)prepareForDismissingProgressViewWithMessage:(NSString *)progressMessage
//{
//    CGFloat it = progressMessage.length * 0.08;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.2
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{
//                             
//                             self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
//                             self.progressView.alpha = 0;
//                             
//                         } completion:^(BOOL finished) {
//                             if(finished){
//                                 
//                             }
//                         }];
//    });
//}
//
//
//
//
//
//
//-(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
//{
//    
//    CGSize notificationSize = [self.notificationView getFrameForNotificationViewWithImage:image message:message];
//    
//    [self.notificationView setFrame:CGRectMake(0,-(notificationSize.height),kFTScreenWidth,notificationSize.height)];
//    
//    [self.notificationView showWithImage:image title:title message:message];
//
//    [[[UIApplication sharedApplication] keyWindow] addSubview:self.notificationView];
//    
//    
//    
//    [UIView animateWithDuration:0.2
//                          delay:0
//         usingSpringWithDamping:0.6
//          initialSpringVelocity:0.5
//                        options:UIViewAnimationOptionCurveEaseIn
//                     animations:^{
//                         
//                         [self.notificationView setFrame:CGRectMake(0,0,kFTScreenWidth,self.notificationView.frame.size.height)];
//                         
//                     } completion:^(BOOL finished) {
//                         if(finished){
//                             [self prepareForDismissingNotificationViewWithMessage:message];
//                         }
//                     }];
//    
//}
//-(void)prepareForDismissingNotificationViewWithMessage:(NSString *)toastMessage
//{
//    CGFloat it = toastMessage.length * 0.08;
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [UIView animateWithDuration:0.2
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseIn
//                         animations:^{
//                             
//                             [self.notificationView setFrame:CGRectMake(0,-(self.notificationView.frame.size.height),kFTScreenWidth,(self.notificationView.frame.size.height))];
//                             
//                         } completion:^(BOOL finished) {
//                             if(finished){
//                                 
//                             }
//                         }];
//    });
//}
//
//
//-(FTToastIndicatorView *)toastView
//{
//    if (!_toastView) {
//        _toastView = [[FTToastIndicatorView alloc] initWithFrame:CGRectZero];
//    }
//    return _toastView;
//}
//
//-(FTProgressIndicatorView *)progressView
//{
//    if (!_progressView) {
//        _progressView = [[FTProgressIndicatorView alloc] initWithFrame:CGRectZero];
//    }
//    return _progressView;
//}
//
//-(FTNotificationIndicatorView *)notificationView
//{
//    if (!_notificationView) {
//        _notificationView = [[FTNotificationIndicatorView alloc] initWithFrame:CGRectZero];
//    }
//    return _notificationView;
//}




@end
