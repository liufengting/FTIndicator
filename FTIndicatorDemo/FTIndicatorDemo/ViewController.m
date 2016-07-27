//
//  ViewController.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "ViewController.h"
#import "FTIndicator.h"

#import "FTToastIndicator.h"
#import "FTProgressIndicator.h"
#import "FTNotificationIndicator.h"

#import <DKNightVersion.h>


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19]}];

}


- (IBAction)switchChanged:(UISwitch *)sender
{
    if (sender.isOn) {
        [[DKNightVersionManager sharedManager] dawnComing];
    }else{
        [[DKNightVersionManager sharedManager] nightFalling];
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    [FTToastIndicator showToastMessage:@"Here is a toast message 0."];
                    break;
                case 1:
                    [FTToastIndicator showToastMessage:@"Here is a toast message 1." withStyle:UIBlurEffectStyleExtraLight];
                    break;
                case 2:
                    [FTToastIndicator showToastMessage:@"Here is a toast message 2." withStyle:UIBlurEffectStyleDark];
                    break;
                default:
                    break;
            }
            break;
        case 1:
            [FTIndicator showNotificationWithImage:[UIImage imageNamed:@"ft_info"]
                                             title:@"Here is a notification title."
                                           message:@"Here is a notification message. This means nothing at all. Here is a notification message. This means nothing at all."];
            break;
        case 2:
            [FTIndicator showProgressWithImage:[UIImage imageNamed:@"ft_info"]
                                       message:@"Here is a progress title. This means nothing at all."];

            
            break;
        default:
            break;
    }
}



@end
