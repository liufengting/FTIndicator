//
//  FTProgressIndicator.m
//  FTIndicator
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "FTProgressIndicator.h"

#pragma mark - Defines

#define kFTProgressMaxWidth                         (240.f)
#define kFTProgressMargin_X                         (20.f)
#define kFTProgressMargin_Y                         (20.f)
#define kFTProgressImageSize                        (30.f)
#define kFTProgressImageToLabel                     (15.f)
#define kFTProgressCornerRadius                     (10.f)
#define kFTProgressDefaultAnimationDuration         (0.2f)
#define kFTProgressDefaultFont                      [UIFont systemFontOfSize:15]
#define kFTProgressDefaultTextColor                 [UIColor blackColor]
#define kFTProgressDefaultTextColor_ForDarkStyle    [UIColor whiteColor]
#define kFTProgressDefaultBackgroundColor           [UIColor clearColor]

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
@property (nonatomic, assign)BOOL isCurrentlyOnScreen;
@property (nonatomic, assign)BOOL userInteractionEnable;

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
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeProgress message:message userInteractionEnable:YES];
}
+(void)showProgressWithmessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeProgress message:message userInteractionEnable:userInteractionEnable];
}
+(void)showInfoWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeInfo message:message userInteractionEnable:YES];
}
+(void)showInfoWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeInfo message:message userInteractionEnable:userInteractionEnable];
}
+(void)showSuccessWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeSuccess message:message userInteractionEnable:YES];
}
+(void)showSuccessWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeSuccess message:message userInteractionEnable:userInteractionEnable];
}
+(void)showErrorWithMessage:(NSString *)message
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeError message:message userInteractionEnable:YES];
}
+(void)showErrorWithMessage:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    [[self sharedInstance] showProgressWithType:FTProgressIndicatorMessageTypeError message:message userInteractionEnable:userInteractionEnable];
}
+(void)dismiss
{
    [[self sharedInstance] dismiss];
}


#pragma mark - instance methods

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onChangeStatusBarOrientationNotification:)
                                                     name:UIApplicationDidChangeStatusBarOrientationNotification
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKeyboardWillChangeFrame:)
                                                     name:UIKeyboardWillChangeFrameNotification
                                                   object:nil];
    }
    return self;
}

-(FTProgressIndicatorView *)progressView
{
    if (!_progressView) {
        _progressView = [[FTProgressIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _progressView;
}
-(void)setUserInteractionEnable:(BOOL)userInteractionEnable
{
    self.progressView.userInteractionEnable = userInteractionEnable;
    _userInteractionEnable = userInteractionEnable;
}

-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message userInteractionEnable:(BOOL)userInteractionEnable
{
    self.messageType = type;
    self.progressMessage = message;
    self.userInteractionEnable = userInteractionEnable;
    self.isCurrentlyOnScreen = NO;

    if (self.isDuringAnimation) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kFTProgressDefaultAnimationDuration * 2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self adjustIndicatorFrame];
        });
    }else{
        [self adjustIndicatorFrame];
    }
}
-(void)dismiss
{
    [self stopDismissTimer];
    [self dismissingProgressView];
}

-(void)adjustIndicatorFrame
{
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    
    CGSize progressSize = [self.progressView getFrameForProgressViewWithMessage:self.progressMessage];
    
    [self.progressView setFrame:CGRectMake((kFTScreenWidth - progressSize.width)/2, (kFTScreenHeight - [self keyboardHeight] - progressSize.height)/2, progressSize.width, progressSize.height)];
    
    [self.progressView showProgressWithType:self.messageType message:self.progressMessage style:self.indicatorStyle userInteractionEnable:self.userInteractionEnable];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.progressView];

    [self startShowingProgressView];
}

-(void)onChangeStatusBarOrientationNotification:(NSNotification *)notification
{
    if (self.isCurrentlyOnScreen) {
        [self adjustIndicatorFrame];
    }
}
-(void)onKeyboardWillChangeFrame:(NSNotification *)notification
{
    
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    CGRect originRect = self.progressView.frame;
    CGFloat y = (MIN(kFTScreenHeight, keyboardRect.origin.y) - originRect.size.height)/2;
    [UIView animateWithDuration:animationDuration
                          delay:0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         [self.progressView setFrame:CGRectMake(originRect.origin.x, y, originRect.size.width, originRect.size.height)];
                     }completion:^(BOOL finished) {
                         
                     }];
}

- (CGFloat)keyboardHeight
{
    for (UIWindow *testWindow in [[UIApplication sharedApplication] windows]){
        if ([[testWindow class] isEqual:[UIWindow class]] == NO){
            for (UIView *possibleKeyboard in [testWindow subviews]){
                if ([[possibleKeyboard description] hasPrefix:@"<UIPeripheralHostView"]){
                    return possibleKeyboard.bounds.size.height;
                }else if ([[possibleKeyboard description] hasPrefix:@"<UIInputSetContainerView"]){
                    for (UIView *hostKeyboard in [possibleKeyboard subviews]){
                        if ([[hostKeyboard description] hasPrefix:@"<UIInputSetHost"]){
                            return hostKeyboard.frame.size.height;
                        }
                    }
                }
            }
        }
    }
    return 0;
}

-(void)startDismissTimer
{
    [self stopDismissTimer];
    if (self.messageType != FTProgressIndicatorMessageTypeProgress) {
        CGFloat timeInterval = MAX(self.progressMessage.length * 0.04 + 0.5, 2.0);
        _dismissTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                         target:self
                                                       selector:@selector(dismissingProgressView)
                                                       userInfo:nil
                                                        repeats:NO];
    }
}
-(void)stopDismissTimer
{
    if (_dismissTimer) {
        [_dismissTimer invalidate];
        _dismissTimer = nil;
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
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         
                     } completion:^(BOOL finished) {
                         if (finished) {
                             self.isDuringAnimation = NO;
                             if (!self.isCurrentlyOnScreen) {
                                 [self startDismissTimer];
                             }
                             self.isCurrentlyOnScreen = YES;
                         }
                     }];
}

-(void)dismissingProgressView
{
    self.isDuringAnimation = YES;
    [UIView animateWithDuration:kFTProgressDefaultAnimationDuration
                          delay:0
                        options:(UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             self.isDuringAnimation = NO;
                             self.isCurrentlyOnScreen = NO;
                             [self.progressView removeFromSuperview];
                             if (!self.userInteractionEnable) {
                                 self.userInteractionEnable = YES;
                             }
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
@property (strong, nonatomic) UIView *backgroundView;

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
-(UIView *)backgroundView
{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _backgroundView.backgroundColor = kFTProgressDefaultBackgroundColor;
    }
    return _backgroundView;
}

-(void)setUserInteractionEnable:(BOOL)userInteractionEnable
{
    self.userInteractionEnabled = userInteractionEnable;
    self.backgroundView.frame = [UIScreen mainScreen].bounds;
    if (userInteractionEnable) {
        [self.backgroundView removeFromSuperview];
    }else{
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.backgroundView];
    }
    self.backgroundView.hidden = userInteractionEnable;
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
    NSString *bundlePath = [[NSBundle bundleForClass:[FTProgressIndicator class]] pathForResource:@"FTProgressIndicator" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:bundlePath];
    switch (type) {
        case FTProgressIndicatorMessageTypeInfo:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_info" inBundle:bundle compatibleWithTraitCollection:nil];
            }else{
                image = [UIImage imageNamed:@"ft_info_dark" inBundle:bundle compatibleWithTraitCollection:nil];
            }
            break;
        case FTProgressIndicatorMessageTypeSuccess:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_success" inBundle:bundle compatibleWithTraitCollection:nil];
            }else{
                image = [UIImage imageNamed:@"ft_success_dark" inBundle:bundle compatibleWithTraitCollection:nil];
            }
            break;
        case FTProgressIndicatorMessageTypeError:
            if (style == UIBlurEffectStyleDark) {
                image = [UIImage imageNamed:@"ft_failure" inBundle:bundle compatibleWithTraitCollection:nil];
            }else{
                image = [UIImage imageNamed:@"ft_failure_dark" inBundle:bundle compatibleWithTraitCollection:nil];
            }
            break;
        default:
            break;
    }
    return image;
}

#pragma mark - main methods

-(void)showProgressWithType:(FTProgressIndicatorMessageType )type message:(NSString *)message style:(UIBlurEffectStyle)style userInteractionEnable:(BOOL)userInteractionEnable
{
    self.effect = [UIBlurEffect effectWithStyle:style];
    
    if (type == FTProgressIndicatorMessageTypeProgress) {
        self.iconImageView.hidden = YES;
        [self.activatyView startAnimating];
    }else{
        self.iconImageView.hidden = NO;
        [self.activatyView stopAnimating];
    }
    self.userInteractionEnable = userInteractionEnable;
    self.messageLabel.text = message;
    self.messageLabel.hidden = !message.length;
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
    CGSize size = CGSizeZero;
    if (progressMessage.length) {
        CGRect textSize = [progressMessage boundingRectWithSize:CGSizeMake(kFTProgressMaxWidth - kFTProgressMargin_X*2, MAXFLOAT)
                                                        options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                                     attributes:@{NSFontAttributeName : kFTProgressDefaultFont}
                                                        context:nil];
        size = CGSizeMake(MAX(textSize.size.width, kFTProgressImageSize), MIN(textSize.size.height ,kFTProgressMaxWidth - kFTProgressMargin_Y*2 - kFTProgressImageToLabel - kFTProgressImageSize));
    }else{
        size = CGSizeMake(kFTProgressImageSize, 0);
    }
    return size;
}

#pragma mark - getFrameForProgressViewWithMessage

-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage
{
    CGSize textSize = [self getFrameForProgressMessageLabelWithMessage:progressMessage];
    CGSize size = CGSizeZero;
    if (progressMessage.length) {
        size = CGSizeMake(MIN(textSize.width + kFTProgressMargin_X*2 , kFTProgressMaxWidth), MIN(textSize.height + kFTProgressMargin_Y*2 + kFTProgressImageSize + kFTProgressImageToLabel,kFTProgressMaxWidth));
    }else{
        size = CGSizeMake(MIN(textSize.width + kFTProgressMargin_X*2 , kFTProgressMaxWidth), kFTProgressMargin_Y*2 + kFTProgressImageSize);
    }
    return size;
}

@end