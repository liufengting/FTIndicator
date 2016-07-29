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

#pragma mark - FTToastIndicator

@interface FTToastIndicator ()

@property (nonatomic, strong)FTToastIndicatorView *toastView;
@property (nonatomic, assign)UIBlurEffectStyle indicatorStyle;
@property (nonatomic, strong)NSString *toastMessage;
@property (nonatomic, strong)NSTimer *dismissTimer;

@end

@implementation FTToastIndicator

#pragma mark - class methods

+(FTToastIndicator *)sharedInstance
{
    static FTToastIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTToastIndicator alloc] init];
    });
    return shared;
}

+(void)setToastIndicatorStyleToDefaultStyle
{
    [self sharedInstance].indicatorStyle = UIBlurEffectStyleLight;
}

+(void)setToastIndicatorStyle:(UIBlurEffectStyle)style
{
    [self sharedInstance].indicatorStyle = style;
}

+(void)showToastMessage:(NSString *)toastMessage
{
    [[self sharedInstance] showToastMessage:toastMessage];
}

#pragma mark - instance methods

-(FTToastIndicatorView *)toastView
{
    if (!_toastView) {
        _toastView = [[FTToastIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _toastView;
}


-(void)showToastMessage:(NSString *)toastMessage
{
    self.toastMessage = toastMessage;
    self.toastView.alpha = 1;
    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    
    CGSize toastSize = [self.toastView getFrameForToastViewWithMessage:toastMessage];
    
    [self.toastView setFrame:CGRectMake((kFTScreenWidth - toastSize.width)/2, kFTScreenHeight - kFTToastToBottom - toastSize.height, toastSize.width, toastSize.height)];
    [self.toastView showToastMessage:toastMessage withStyle:self.indicatorStyle];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.toastView];
    
    self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    
    [self startShowingToastView];
}

-(void)startDismissTimer
{
    if (_dismissTimer) {
        [_dismissTimer invalidate];
        _dismissTimer = nil;
    }
    CGFloat timeInterval = self.toastMessage.length * 0.04 + 0.5;

    _dismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                     target:self
                                                   selector:@selector(dismissingToastView)
                                                   userInfo:nil
                                                    repeats:NO];
}

-(void)startShowingToastView
{
    [UIView animateWithDuration:kFTToastDefaultAnimationDuration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [self startDismissTimer];
                         }
                     }];
}

-(void)dismissingToastView
{
    [UIView animateWithDuration:kFTToastDefaultAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.toastView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             [self.toastView removeFromSuperview];
                         }
                     }];
}

@end

#pragma mark - FTToastIndicatorView

@interface FTToastIndicatorView ()

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) UILabel *messageLabel;

@end

@implementation FTToastIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = kFTToastCornerRadius;
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    return self;
}

#pragma mark - getters

-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        _messageLabel.textColor = kFTToastDefaultTextColor;
        _messageLabel.font = kFTToastDefaultFont;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}

-(UIColor *)getTextColorWithStyle:(UIBlurEffectStyle)style
{
    switch (style) {
        case UIBlurEffectStyleDark:
            return kFTToastDefaultTextColor_ForDarkStyle;
            break;
        default:
            return kFTToastDefaultTextColor;
            break;
    }
}

#pragma mark - main methods

-(void)showToastMessage:(NSString *)toastMessage withStyle:(UIBlurEffectStyle)style
{
    self.effect = [UIBlurEffect effectWithStyle:style];
    
    self.message = toastMessage;
    self.messageLabel.textColor = [self getTextColorWithStyle:style];
    self.messageLabel.text = toastMessage;

    CGSize labelSize = [self getFrameForToastLabelWithMessage:toastMessage];
    CGSize viewSize = [self getFrameForToastViewWithMessage:toastMessage];
    CGRect rect = CGRectMake((viewSize.width - labelSize.width)/2, (viewSize.height - labelSize.height)/2, labelSize.width, labelSize.height);
    self.messageLabel.frame = rect;
}

#pragma mark - getFrameForToastLabelWithMessage

-(CGSize )getFrameForToastLabelWithMessage:(NSString *)toastMessage
{
    CGRect textSize = [toastMessage boundingRectWithSize:CGSizeMake(kFTToastMaxWidth - kFTToastMargin_X*2, MAXFLOAT)
                                                 options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                              attributes:@{NSFontAttributeName : kFTToastDefaultFont}
                                                 context:nil];
    CGSize size = CGSizeMake(textSize.size.width, MIN(textSize.size.height ,kFTToastMaxHeight - kFTToastMargin_Y*2));
    return size;
}

#pragma mark - getFrameForToastViewWithMessage

-(CGSize )getFrameForToastViewWithMessage:(NSString *)toastMessage
{
    CGSize textSize = [self getFrameForToastLabelWithMessage:toastMessage];
    CGSize size = CGSizeMake(MIN(textSize.width + kFTToastMargin_X*2 , kFTToastMaxWidth), MIN(textSize.height + kFTToastMargin_Y*2 ,kFTToastMaxHeight));
    return size;
}



@end