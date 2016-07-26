//
//  FTProgressIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTProgressIndicator.h"

@implementation FTProgressIndicator

@end


#define kFTScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kFTScreenHeight   [UIScreen mainScreen].bounds.size.height

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