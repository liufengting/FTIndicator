//
//  FTProgressIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTProgressIndicator.h"

#define kFTScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kFTScreenHeight   [UIScreen mainScreen].bounds.size.height

#pragma mark - FTProgressIndicator

@interface FTProgressIndicator ()

@property (nonatomic, strong)FTProgressIndicatorView *progressView;
@property (nonatomic, assign)UIBlurEffectStyle indicatorStyle;
@property (nonatomic, strong)NSString *progressMessage;
@property (nonatomic, strong)NSTimer *dismissTimer;
@property (nonatomic, assign)FTProgressIndicatorMessageType  messageType;
@property (nonatomic, assign)BOOL isDuringAnimation;

@end

@implementation FTProgressIndicator

#pragma mark - class methods

+(FTProgressIndicator *)sharedInstance
{
    static FTProgressIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTProgressIndicator alloc] init];
    });
    return shared;
}

+(void)setProgressIndicatorStyleToDefaultStyle
{
    [self sharedInstance].indicatorStyle = UIBlurEffectStyleLight;
}
+(void)setProgressIndicatorStyle:(UIBlurEffectStyle)style
{
    [self sharedInstance].indicatorStyle = style;
}
+(void)showProgressWithmessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeProgress message:message];
}
+(void)showInfoWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeInfo message:message];
}
+(void)showSuccessWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeSuccess message:message];
}
+(void)showErrorWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeError message:message];
}

#pragma mark - instance methods

-(FTProgressIndicatorView *)progressView
{
    if (!_progressView) {
        _progressView = [[FTProgressIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _progressView;
}


-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message
{
    self.messageType = type;
    self.progressMessage = message;
    
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);

    CGSize progressSize = [self.progressView getFrameForProgressViewWithMessage:message];
    
    [self.progressView setFrame:CGRectMake((kFTScreenWidth - progressSize.width)/2, (kFTScreenHeight - progressSize.height)/2, progressSize.width, progressSize.height)];

    [self.progressView showProgressWithType:type message:message style:self.indicatorStyle];

    [[[UIApplication sharedApplication] keyWindow] addSubview:self.progressView];
    
    if (self.isDuringAnimation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kFTProgressDefaultAnimationDuration * 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startShowingProgressView];
        });
    }else{
        [self startShowingProgressView];
    }
    
}


-(void)startDismissTimer
{
    if (self.messageType != FTProgressIndicatorMessageTypeProgress) {
        if (_dismissTimer) {
            [_dismissTimer invalidate];
            _dismissTimer = nil;
        }
        CGFloat timeInterval = self.progressMessage.length * 0.04 + 0.5;
        
        _dismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                         target:self
                                                       selector:@selector(dismissingProgressView)
                                                       userInfo:nil
                                                        repeats:NO];
    }


}

-(void)startShowingProgressView
{
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    self.isDuringAnimation = YES;
    [UIView animateWithDuration:kFTProgressDefaultAnimationDuration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                             self.isDuringAnimation = NO;
                             [self startDismissTimer];
                         }
                     }];
}

-(void)dismissingProgressView
{
    self.isDuringAnimation = YES;
    [UIView animateWithDuration:kFTProgressDefaultAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             self.isDuringAnimation = NO;
                             [self.progressView removeFromSuperview];
                         }
                     }];
}



@end

#pragma mark - FTProgressIndicatorView

@interface FTProgressIndicatorView ()

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UIActivityIndicatorView *activatyView;
@property (strong, nonatomic) UILabel *messageLabel;

@end

@implementation FTProgressIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = kFTProgressCornerRadius;
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    }
    return self;
}

#pragma mark - getters

-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.backgroundColor = [UIColor clearColor];
        _iconImageView.image = [UIImage imageNamed:@"ft_info"];
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}
-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.textColor = kFTProgressDefaultTextColor;
        _messageLabel.font = kFTProgressDefaultFont;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}
-(UIActivityIndicatorView *)activatyView
{
    if (!_activatyView) {
        _activatyView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activatyView.color = kFTProgressDefaultTextColor;
        [_activatyView setHidesWhenStopped:YES];
        [self.contentView addSubview:_activatyView];
    }
    return _activatyView;
}

-(UIColor *)getTextColorWithStyle:(UIBlurEffectStyle)style
{
    switch (style) {
        case UIBlurEffectStyleDark:
            return kFTProgressDefaultTextColor_ForDarkStyle;
            break;
        default:
            return kFTProgressDefaultTextColor;
            break;
    }
}
-(UIImage *)getImageWithStyle:(UIBlurEffectStyle)style messageType:(FTProgressIndicatorMessageType )type
{
    UIImage *image;
    switch (type) {
        case FTProgressIndicatorMessageTypeInfo:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_info"];
            }else{
                image = [UIImage imageNamed:@"ft_info_dark"];
            }
            break;
        case FTProgressIndicatorMessageTypeSuccess:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_success"];
            }else{
                image = [UIImage imageNamed:@"ft_success_dark"];
            }
            break;
        case FTProgressIndicatorMessageTypeError:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_failure"];
            }else{
                image = [UIImage imageNamed:@"ft_failure_dark"];
            }
            break;
        default:
            break;
    }
    return image;
}

#pragma mark - main methods

-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message style:(UIBlurEffectStyle)style
{
    self.effect = [UIBlurEffect effectWithStyle:style];
    
    if (type == FTProgressIndicatorMessageTypeProgress) {
        self.iconImageView.hidden = YES;
        [self.activatyView startAnimating];
    }else{
        self.iconImageView.hidden = NO;
        [self.activatyView stopAnimating];
    }
    
    self.messageLabel.text = message;
    self.messageLabel.textColor = [self getTextColorWithStyle:style];
    self.activatyView.color = [self getTextColorWithStyle:style];
    self.iconImageView.image = [self getImageWithStyle:style messageType:type];

    
    CGSize messageSize = [self getFrameForProgressMessageLabelWithMessage:message];
    CGSize viewSize = [self getFrameForProgressViewWithMessage:message];
    
    CGRect rect = CGRectMake((viewSize.width - messageSize.width)/2, kFTProgressMargin_Y + kFTProgressImageSize + kFTProgressImageToLabel, messageSize.width, messageSize.height);
    
    self.iconImageView.frame = CGRectMake((viewSize.width - kFTProgressImageSize)/2, kFTProgressMargin_Y, kFTProgressImageSize,  kFTProgressImageSize);
    self.activatyView.frame = CGRectMake((viewSize.width - kFTProgressImageSize)/2, kFTProgressMargin_Y, kFTProgressImageSize,  kFTProgressImageSize);

    self.messageLabel.frame = rect;
    
}

#pragma mark - getFrameForProgressMessageLabelWithMessage

-(CGSize )getFrameForProgressMessageLabelWithMessage:(NSString *)progressMessage
{
    CGRect textSize = [progressMessage boundingRectWithSize:CGSizeMake(kFTProgressMaxWidth - kFTProgressMargin_X*2, MAXFLOAT)
                                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                                 attributes:@{NSFontAttributeName : kFTProgressDefaultFont}
                                                    context:nil];
    CGSize size = CGSizeMake(textSize.size.width, MIN(textSize.size.height ,kFTProgressMaxWidth - kFTProgressMargin_Y*2 - kFTProgressImageToLabel - kFTProgressImageSize));
    return size;
}

#pragma mark - getFrameForProgressViewWithMessage

-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage
{
    CGSize textSize = [self getFrameForProgressMessageLabelWithMessage:progressMessage];
    CGSize size = CGSizeMake(MIN(textSize.width + kFTProgressMargin_X*2 , kFTProgressMaxWidth), MIN(textSize.height + kFTProgressMargin_Y*2 + kFTProgressImageSize + kFTProgressImageToLabel,kFTProgressMaxWidth));
    return size;
}



@end