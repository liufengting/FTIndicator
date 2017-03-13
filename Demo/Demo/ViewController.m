//
//  ViewController.m
//  FTIndicator
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "ViewController.h"
#import "FTIndicator.h"

#import "FTToastIndicator.h"
#import "FTProgressIndicator.h"
#import "FTNotificationIndicator.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switcher;
@property (nonatomic, strong)UIImageView *backgroudImage;
@property (nonatomic, strong)UIColor *themeColor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self.tableView setBackgroundView:self.backgroudImage];
    
    [self showAnotherTheme:YES];
}


- (IBAction)switchChanged:(UISwitch *)sender
{
    [self showAnotherTheme:sender.isOn];
}


- (void)showAnotherTheme:(BOOL)isLight
{
    self.themeColor = isLight ? [UIColor blackColor] : [UIColor whiteColor];
    
    self.backgroudImage.image = [UIImage imageNamed:isLight ? @"light.jpeg" : @"dark.jpeg"];
    
    self.tableView.separatorColor = self.themeColor;
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:self.themeColor,NSFontAttributeName:[UIFont boldSystemFontOfSize:19]}];

    [self.navigationController.navigationBar setTintColor:self.themeColor];
    
    [UIApplication sharedApplication].statusBarStyle = isLight ? UIStatusBarStyleDefault : UIStatusBarStyleLightContent;

    [self.tableView reloadData];
    
    
    [FTIndicator setIndicatorStyle:isLight ? UIBlurEffectStyleLight : UIBlurEffectStyleDark];
    
    [FTIndicator showInfoWithMessage:isLight ? @"Daylight Version on." : @"Night Version on."];
}



- (UIImageView *)backgroudImage
{
    if (!_backgroudImage) {
        _backgroudImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"light.jpeg"]];
        _backgroudImage.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backgroudImage;
}
- (UIColor *)themeColor
{
    if (!_themeColor) {
        _themeColor = [UIColor blackColor];
    }
    return _themeColor;
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    [((UITableViewHeaderFooterView *) view).textLabel setTextColor:self.themeColor];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[self.themeColor colorWithAlphaComponent:0.1]];
    [cell.textLabel setTextColor:self.themeColor];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    [FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                                     title:@"Here is a notification title."
                                                   message:@"Here is a notification message. Try to swipe it up or tap at 'Dismiss Notification' cell"];
                    break;
                case 1:
                    [FTIndicator showNotificationWithTitle:@"Here is a notification title."
                                                   message:@"Here is a notification message. Try to swipe it up or tap at 'Dismiss Notification' cell"];
                    break;
                case 2:
                    [FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                                     title:@"Here is a notification title."
                                                   message:@"Here is a notification message. Try to tap and see tap handling or do nothing to see completion"
                                                tapHandler:^{
                                            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tap Handling"
                                                                                                message:@"This happen when you tap notification"
                                                                                               delegate:nil
                                                                                      cancelButtonTitle:@"OK"
                                                                                      otherButtonTitles:nil];
                                            [alertView show];
                                                   } completion:^{
                                                       [FTIndicator showInfoWithMessage:@"Notification dismissed"];
                                                   }];
                    break;
                case 3:
                    [FTIndicator showNotificationWithImage:[UIImage imageNamed:@"maps_icon"]
                                                     title:@"Here is a notification title. Special."
                                                   message:@"Here is a notification message. Only if user tap or swipe, will I dismiss."
                                               autoDismiss:NO
                                                tapHandler:^{
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Tap Handling"
                                                                                                        message:@"This happen when you tap notification"
                                                                                                       delegate:nil
                                                                                              cancelButtonTitle:@"OK"
                                                                                              otherButtonTitles:nil];
                                                    [alertView show];
                                                } completion:^{
                                                    [FTIndicator showInfoWithMessage:@"Notification dismissed"];
                                                }];
                    break;
                case 4:
                    [FTIndicator dismissNotification];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    [FTIndicator showProgressWithmessage:nil userInteractionEnable:YES];
                    break;
                case 1:
                    [FTIndicator showSuccessWithMessage:@"Here is a progress title. This means nothing at all."];
                    break;
                case 2:
                    [FTIndicator showInfoWithMessage:@"When this is showing, userInteraction not enabled." userInteractionEnable:NO];
                    break;
                case 3:
//                    [FTIndicator showErrorWithMessage:@"Here is a progress title. This means nothing at all."];
                    [FTIndicator showErrorWithMessage:@"Here is a error message, with custom image support."
                                                image:[UIImage imageNamed:@"maps_icon"]
                                userInteractionEnable:YES];
                    break;
                case 4:
                    [FTIndicator dismissProgress];
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    [FTIndicator showToastMessage:@"Short Toast."];
                    break;
                case 1:
                    [FTIndicator showToastMessage:@"Here is a long long toast message, see if it can break lines."];
                    break;
                case 2:
                    [FTIndicator dismissToast];
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}



@end
