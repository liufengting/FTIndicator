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

@interface FTProgressIndicator ()

@property (nonatomic, strong)FTProgressIndicatorView *progressView;


@end

@implementation FTProgressIndicator

+(FTProgressIndicator *)sharedInstance
{
    static FTProgressIndicator *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[FTProgressIndicator alloc] init];
    });
    return shared;
}

+(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage
{
    [[self sharedInstance] showProgressWithImage:image message:progressMessage];
}



-(FTProgressIndicatorView *)progressView
{
    if (!_progressView) {
        _progressView = [[FTProgressIndicatorView alloc] initWithFrame:CGRectZero];
    }
    return _progressView;
}


-(void)showProgressWithImage:(UIImage *)image message:(NSString *)progressMessage
{
    self.progressView.alpha = 1;
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    
    CGSize progressSize = [self.progressView getFrameForProgressViewWithMessage:progressMessage];
    
    [self.progressView setFrame:CGRectMake((kFTScreenWidth - progressSize.width)/2, (kFTScreenHeight - progressSize.height)/2, progressSize.width, progressSize.height)];
    [self.progressView showProgressWithImage:image message:progressMessage];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.progressView];
    
    self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
    
    
    [UIView animateWithDuration:0.2
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                         
                     } completion:^(BOOL finished) {
                         if(finished){
                             [self prepareForDismissingProgressViewWithMessage:progressMessage];
                         }
                     }];
    
}
-(void)prepareForDismissingProgressViewWithMessage:(NSString *)progressMessage
{
    CGFloat it = progressMessage.length * 0.08;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(it * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             
                             self.progressView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.4, 0.4);
                             self.progressView.alpha = 0;
                             
                         } completion:^(BOOL finished) {
                             if(finished){
                                 
                             }
                         }];
    });
}



@end



@interface FTProgressIndicatorView ()

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *messageLabel;

@property (strong, nonatomic) UIFont *perferedFont;

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
        _messageLabel.textColor = [UIColor whiteColor];
        _messageLabel.font = self.perferedFont;
        _messageLabel.textAlignment = NSTextAlignmentCenter;
        _messageLabel.numberOfLines = 0;
        [self.contentView addSubview:_messageLabel];
    }
    return _messageLabel;
}

-(UIFont *)perferedFont
{
    if (!_perferedFont) {
        _perferedFont = [UIFont systemFontOfSize:15];
    }
    return _perferedFont;
}

-(void)showProgressWithImage:(UIImage *)image message:(NSString *)message
{
    self.iconImageView.image = image ? image : [UIImage imageNamed:@"ft_info"];
    
    self.messageLabel.text = message;
    
    CGSize messageSize = [self getFrameForProgressMessageLabelWithMessage:message];
    CGSize viewSize = [self getFrameForProgressViewWithMessage:message];
    
    CGRect rect = CGRectMake((viewSize.width - messageSize.width)/2, kFTProgressMargin_Y + kFTProgressImageSize + kFTProgressImageToLabel, messageSize.width, messageSize.height);
    
    self.iconImageView.frame = CGRectMake((viewSize.width - kFTProgressImageSize)/2, kFTProgressMargin_Y, kFTProgressImageSize,  kFTProgressImageSize);
    self.messageLabel.frame = rect;
    
}


-(CGSize )getFrameForProgressMessageLabelWithMessage:(NSString *)progressMessage
{
    CGRect textSize = [progressMessage boundingRectWithSize:CGSizeMake(kFTProgressMaxWidth - kFTProgressMargin_X*2, MAXFLOAT)
                                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin)
                                                 attributes:@{NSFontAttributeName : self.perferedFont}
                                                    context:nil];
    CGSize size = CGSizeMake(textSize.size.width, MIN(textSize.size.height ,kFTProgressMaxWidth - kFTProgressMargin_Y*2 - kFTProgressImageToLabel - kFTProgressImageSize));
    return size;
}

-(CGSize )getFrameForProgressViewWithMessage:(NSString *)progressMessage
{
    CGSize textSize = [self getFrameForProgressMessageLabelWithMessage:progressMessage];
    CGSize size = CGSizeMake(MIN(textSize.width + kFTProgressMargin_X*2 , kFTProgressMaxWidth), MIN(textSize.height + kFTProgressMargin_Y*2 + kFTProgressImageSize + kFTProgressImageToLabel,kFTProgressMaxWidth));
    return size;
}



@end