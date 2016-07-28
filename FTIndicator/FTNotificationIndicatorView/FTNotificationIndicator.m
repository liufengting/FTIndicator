//
//  FTNotificationIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTNotificationIndicator.h"

#define kFTScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kFTScreenHeight   [UIScreen mainScreen].bounds.size.height


@interface FTNotificationIndicator ()

@property (nonatomic, strong)FTNotificationIndicatorView *notificationView;
@property (nonatomic, assign)UIBlurEffectStyle indicatorStyle;
@property (nonatomic, strong)NSString *notificationMessage;
@property (nonatomic, strong)NSTimer *dismissTimer;

@end

@implementation FTNotificationIndicator


+(FTNotificationIndicator *)sharedInstance
{
    static FTNotificationIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTNotificationIndicator alloc] init];
    });
    return shared;
}

+(void)setNotificationIndicatorStyleToDefaultStyle
{
    [self sharedInstance].indicatorStyle = UIBlurEffectStyleLight;

}
+(void)setNotificationIndicatorStyle:(UIBlurEffectStyle)style
{
    [self sharedInstance].indicatorStyle = style;
}
+(void)showNotificationWithTitle:(NSString *)title message:(NSString *)message
{
    [[self sharedInstance] showNotificationWithImage:nil title:title message:message];
}
+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    [[self sharedInstance] showNotificationWithImage:image title:title message:message];
}


-(FTNotificationIndicatorView *)notificationView
{
    if (!_notificationView) {
        _notificationView = [[FTNotificationIndicatorView alloc] initWithFrame:CGRectZero];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGuestureRecognized:)];
        [_notificationView addGestureRecognizer:pan];
    }
    return _notificationView;
}

-(void)onPanGuestureRecognized:(UIPanGestureRecognizer *)sender
{
    CGPoint translation = [sender translationInView:[[UIApplication sharedApplication] keyWindow]];
    switch (sender.state) {
        case UIGestureRecognizerStateBegan: case UIGestureRecognizerStateChanged:
            if (translation.y < 0) {
                [self.notificationView setFrame:CGRectMake(0,translation.y,kFTScreenWidth,self.notificationView.frame.size.height)];
            }
            break;
        case UIGestureRecognizerStateEnded:
            [self stopDismissTimer];
            [self dismissingNotificationtView];
            break;
        default:
            break;
    }

    
}

-(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    self.notificationMessage = message;
    
    CGSize notificationSize = [self.notificationView getFrameForNotificationViewWithImage:image message:message];
    
    [self.notificationView setFrame:CGRectMake(0,-(notificationSize.height),kFTScreenWidth,notificationSize.height)];
    
    [self.notificationView showWithImage:image title:title message:message style:self.indicatorStyle];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.notificationView];
    
    [self startShowingNotificationView];
    
    
}

-(void)startDismissTimer
{
    [self stopDismissTimer];
    CGFloat timeInterval = self.notificationMessage.length * 0.04 + 0.5;
    
    _dismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                     target:self
                                                   selector:@selector(dismissingNotificationtView)
                                                   userInfo:nil
                                                    repeats:NO];
}
-(void)stopDismissTimer
{
    if (_dismissTimer) {
        [_dismissTimer invalidate];
        _dismissTimer = nil;
    }
}

-(void)startShowingNotificationView
{
    [UIView animateWithDuration:kFTNotificationDefaultAnimationDuration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.8
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [self.notificationView setFrame:CGRectMake(0,0,kFTScreenWidth,self.notificationView.frame.size.height)];
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                             [self startDismissTimer];
                         }
                     }];
}

-(void)dismissingNotificationtView
{
    [UIView animateWithDuration:kFTNotificationDefaultAnimationDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [self.notificationView setFrame:CGRectMake(0,-(self.notificationView.frame.size.height),kFTScreenWidth,(self.notificationView.frame.size.height))];
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             [self.notificationView removeFromSuperview];
                         }
                     }];
}



@end


@interface FTNotificationIndicatorView ()

@property (strong, nonatomic) NSString *message;

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;

@end

@implementation FTNotificationIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    }
    return self;
}

#pragma mark - getters
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kFTNotificationMargin_X, kFTNotificationStatusBarHeight + kFTNotificationMargin_Y, kFTNotificationImageSize, kFTNotificationImageSize)];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _iconImageView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFTNotificationMargin_X*2 + kFTNotificationImageSize, kFTNotificationStatusBarHeight, kFTScreenWidth - kFTNotificationMargin_X*2 - kFTNotificationImageSize,  kFTNotificationTitleHeight)];
        _titleLabel.font = kFTNotificationDefaultTitleFont;
        _titleLabel.textColor = kFTNotificationDefaultTextColor;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFTNotificationMargin_X*2 + kFTNotificationImageSize, kFTNotificationStatusBarHeight+kFTNotificationTitleHeight, kFTScreenWidth - kFTNotificationMargin_X*2 - kFTNotificationImageSize, 40)];
        _messageLabel.textColor = kFTNotificationDefaultTextColor;
        _messageLabel.font = kFTNotificationDefaultMessageFont;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}
-(UIColor *)getTextColorWithStyle:(UIBlurEffectStyle)style
{
    switch (style) {
        case UIBlurEffectStyleDark:
            return kFTNotificationDefaultTextColor_ForDarkStyle;
            break;
        default:
            return kFTNotificationDefaultTextColor;
            break;
    }
}


-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message style:(UIBlurEffectStyle)style
{
    self.effect = [UIBlurEffect effectWithStyle:style];

    if (image) {
        self.iconImageView.image = image;
    }
    self.iconImageView.hidden = !(image);
    self.titleLabel.text = title;
    self.messageLabel.text = message;
    self.titleLabel.textColor = [self getTextColorWithStyle:style];
    self.messageLabel.textColor = [self getTextColorWithStyle:style];

    
    CGSize messageSize = [self getFrameForNotificationMessageLabelWithImage:self.iconImageView.image message:message];
    
    
    CGFloat text_X = image ? kFTNotificationMargin_X*2 + kFTNotificationImageSize : kFTNotificationMargin_X;
    
    
    self.titleLabel.frame = CGRectMake(text_X, kFTNotificationStatusBarHeight, kFTScreenWidth - kFTNotificationMargin_X - text_X,  kFTNotificationTitleHeight);
    self.messageLabel.frame = CGRectMake(text_X, kFTNotificationStatusBarHeight+kFTNotificationTitleHeight, kFTScreenWidth - kFTNotificationMargin_X - text_X, messageSize.height);
    
    
    NSLog(@"%@",NSStringFromCGRect(self.messageLabel.frame));
    
}


-(CGSize )getFrameForNotificationMessageLabelWithImage:(UIImage *)image message:(NSString *)notificationMessage
{
    CGFloat textWidth = image ? (kFTScreenWidth - kFTNotificationMargin_X*3 - kFTNotificationImageSize) : (kFTScreenWidth - kFTNotificationMargin_X*2);
    CGRect textSize = [notificationMessage boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT)
                                                        options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                                     attributes:@{NSFontAttributeName : kFTNotificationDefaultMessageFont}
                                                        context:nil];
    CGSize size = CGSizeMake(textSize.size.width, MIN(textSize.size.height ,kFTNotificationMaxHeight - kFTNotificationTitleHeight - kFTNotificationStatusBarHeight - kFTNotificationMargin_Y));
    return size;
}

-(CGSize )getFrameForNotificationViewWithImage:(UIImage *)image message:(NSString *)notificationMessage
{
    CGSize textSize = [self getFrameForNotificationMessageLabelWithImage:image message:notificationMessage];
    CGSize size = CGSizeMake(kFTScreenWidth, MIN(textSize.height + kFTNotificationMargin_Y + kFTNotificationTitleHeight + kFTNotificationStatusBarHeight,kFTNotificationMaxHeight));
    return size;
}






@end