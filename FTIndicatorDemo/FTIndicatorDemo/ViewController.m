//
//  ViewController.m
//  FTIndicatorDemo
//
//  Created by liufengting on 16/7/21.
//  Copyright © 2016年 liufengting. All rights reserved.
//

#import "ViewController.h"
#import "FTIndicator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:19]}];

}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.section) {
        case 0:
            [FTIndicator showToastMessage:@"Here is a toast message."];
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
