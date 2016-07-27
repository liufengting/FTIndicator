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

+(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    [[self sharedInstance] showNotificationWithImage:image title:title message:message];
}

-(FTNotificationIndicatorView *)notificationView
{
    if (!_notificationView) {
        _notificationView = [[FTNotificationIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _notificationView;
}


-(void)showNotificationWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    self.notificationMessage = message;
    
    
    CGSize notificationSize = [self.notificationView getFrameForNotificationViewWithImage:image message:message];
    
    [self.notificationView setFrame:CGRectMake(0,-(notificationSize.height),kFTScreenWidth,notificationSize.height)];
    
    [self.notificationView showWithImage:image title:title message:message];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.notificationView];
    
    [self startShowingNotificationView];
    
    
}
-(void)prepareForDismissingNotificationViewWithMessage:(NSString *)toastMessage
{
    CGFloat it = toastMessage.length * 0.08;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             [self.notificationView setFrame:CGRectMake(0,-(self.notificationView.frame.size.height),kFTScreenWidth,(self.notificationView.frame.size.height))];
                             
                         } completion:^(BOOL finished) {
                             if(finished){
                                 
                             }
                         }];
    });
}

-(void)startDismissTimer
{
    if (_dismissTimer) {
        [_dismissTimer invalidate];
        _dismissTimer = nil;
    }
    CGFloat timeInterval = self.notificationMessage.length * 0.08;
    
    _dismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                     target:self
                                                   selector:@selector(dismissingNotificationtView)
                                                   userInfo:nil
                                                    repeats:NO];
}

-(void)startShowingNotificationView
{
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
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
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         [self.notificationView setFrame:CGRectMake(0,-(self.notificationView.frame.size.height),kFTScreenWidth,(self.notificationView.frame.size.height))];
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             
                         }
                     }];
}



@end


@interface FTNotificationIndicatorView ()

@property (strong, nonatomic) NSString *message;

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *messageLabel;

@property (strong, nonatomic) UIFont *perferedMessageFont;

@end

@implementation FTNotificationIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
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
        _iconImageView.image = [UIImage imageNamed:@"ft_info"];
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFTNotificationMargin_X*2 + kFTNotificationImageSize, kFTNotificationStatusBarHeight, kFTScreenWidth - kFTNotificationMargin_X*2 - kFTNotificationImageSize,  kFTNotificationTitleHeight)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(kFTNotificationMargin_X*2 + kFTNotificationImageSize, kFTNotificationStatusBarHeight+kFTNotificationTitleHeight, kFTScreenWidth - kFTNotificationMargin_X*2 - kFTNotificationImageSize, 40)];
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = self.perferedMessageFont;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}

-(UIFont *)perferedMessageFont
{
    if (!_perferedMessageFont) {
        _perferedMessageFont = [UIFont systemFontOfSize:13];
    }
    return _perferedMessageFont;
}



-(void)showWithImage:(UIImage *)image title:(NSString *)title message:(NSString *)message
{
    if (image) {
        self.iconImageView.image = image;
    }
    self.iconImageView.hidden = !(image);
    self.titleLabel.text = title;
    self.messageLabel.text = message;
    
    
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
                                                     attributes:@{NSFontAttributeName : self.perferedMessageFont}
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