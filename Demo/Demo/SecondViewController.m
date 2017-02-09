//
//  SecondViewController.m
//  Demo
//
//  Created by liufengting on 16/7/30.
//  Copyright © 2016年 liufengting ( https://github.com/liufengting ). All rights reserved.
//

#import "SecondViewController.h"

#import "FTProgressIndicator.h"
#import "FTToastIndicator.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [FTProgressIndicator showProgressWithmessage:nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSInteger i = 0; i < 1000; i++) {
            NSLog(@"print out %ld",i);
        }
        
//        sleep(3);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [FTProgressIndicator dismiss];
        });
    });
    
}
- (IBAction)addButtonTapped:(UIBarButtonItem *)sender
{
    
    // do any test you want
    
    [FTProgressIndicator showProgressWithmessage:@"Uploading..." userInteractionEnable:NO];
    
    [self.view endEditing:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [FTProgressIndicator showSuccessWithMessage:@"Upload succeeded."];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.navigationController popViewControllerAnimated:YES];
            
        });
    });
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
