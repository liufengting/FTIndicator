//
//  FTToastIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTToastIndicator.h"

#define kFTScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kFTScreenHeight   [UIScreen mainScreen].bounds.size.height


@interface FTToastIndicator ()

@property (nonatomic, assign)UIBlurEffectStyle *style;
@property (nonatomic, strong)FTToastIndicatorView *toastView;

@end

@implementation FTToastIndicator

+(FTToastIndicator *)sharedInstance
{
    static FTToastIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTToastIndicator alloc] init];
    });
    return shared;
}

+(void)setToastIndicatorStyle:(FTToastIndicatorStyle)style
{
    
}

+(void)showToastMessage:(NSString *)toastMessage
{
    [[self sharedInstance] showToastMessage:toastMessage];
}



-(FTToastIndicatorView *)toastView
{
    if (!_toastView) {
        _toastView = [[FTToastIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _toastView;
}

-(void)showToastMessage:(NSString *)toastMessage
{
    self.toastView.alpha = 1;
    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    
    CGSize toastSize = [self.toastView getFrameForToastViewWithMessage:toastMessage];
    
    [self.toastView setFrame:CGRectMake((kFTScreenWidth - toastSize.width)/2, kFTScreenHeight - kFTToastToBottom - toastSize.height, toastSize.width, toastSize.height)];
    [self.toastView showToastMessage:toastMessage];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.toastView];
    
    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    
    
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             [self prepareForDismissingToastViewWithMessage:toastMessage];
                         }
                     }];
    
}
-(void)prepareForDismissingToastViewWithMessage:(NSString *)toastMessage
{
    CGFloat it = toastMessage.length * 0.08;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                             self.toastView.alpha = 0;
                             
                         } completion:^(BOOL finished) {
                             if(finished){
                                 
                             }
                         }];
    });
}

@end


@interface FTToastIndicatorView ()

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) UILabel *messageLabel;
@property (strong, nonatomic) UIFont *perferedFont;

@end

@implementation FTToastIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = kFTToastCornerRadius;
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    }
    return self;
}

#pragma mark - getters

-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = self.perferedFont;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}

-(void)showToastMessage:(NSString *)toastMessage
{
    self.message = toastMessage;
    self.messageLabel.text = toastMessage;
    self.messageLabel.font = self.perferedFont;
    
    
    CGSize labelSize = [self getFrameForToastLabelWithMessage:toastMessage];
    CGSize viewSize = [self getFrameForToastViewWithMessage:toastMessage];
    CGRect rect = CGRectMake((viewSize.width - labelSize.width)/2, (viewSize.height - labelSize.height)/2, labelSize.width, labelSize.height);
    self.messageLabel.frame = rect;
    
}

-(UIFont *)perferedFont
{
    if (!_perferedFont) {
        _perferedFont = [UIFont systemFontOfSize:15];
    }
    return _perferedFont;
}

-(CGSize )getFrameForToastLabelWithMessage:(NSString *)toastMessage
{
    CGRect textSize = [toastMessage boundingRectWithSize:CGSizeMake(kFTToastMaxWidth - kFTToastMargin_X*2, MAXFLOAT)
                                                 options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                              attributes:@{NSFontAttributeName : self.perferedFont}
                                                 context:nil];
    CGSize size = CGSizeMake(textSize.size.width, MIN(textSize.size.height ,kFTToastMaxHeight - kFTToastMargin_Y*2));
    return size;
}
-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage
{
    CGSize textSize = [self getFrameForToastLabelWithMessage:toastMessage];
    CGSize size = CGSizeMake(MIN(textSize.width + kFTToastMargin_X*2 , kFTToastMaxWidth), MIN(textSize.height + kFTToastMargin_Y*2 ,kFTToastMaxHeight));
    return size;
}



@end