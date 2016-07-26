//
//  FTToastIndicator.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/26.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "FTToastIndicator.h"

@implementation FTToastIndicator

@end

#define kFTScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kFTScreenHeight   [UIScreen mainScreen].bounds.size.height

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