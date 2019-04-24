//
//  ViewController.m
//  demo
//
//  Created by linzhiman on 2018/8/21.
//  Copyright © 2018年 linzhiman. All rights reserved.
//

#import "ViewController.h"
#import "ATNotificationUtils.h"

AT_STRING_DEFINE(kNotification_1)
AT_STRING_DEFINE(kNotification_2)

@interface ViewController ()

@end

@implementation ViewController

- (void)dealloc
{
    [ATNOTIFICATION_SIGNALTON removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ATNOTIFICATION_SIGNALTON addObserver:self name:kNotification_1 callback:^(NSDictionary * _Nullable userInfo) {
        NSLog(@"at kNotification_1 %@", userInfo);
    }];
    [ATNOTIFICATION_SIGNALTON addObserver:self name:kNotification_2 callback:^(NSDictionary * _Nullable userInfo) {
        NSLog(@"at kNotification_2 %@", userInfo);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_1 object:self userInfo:@{@"abc":@(1)}];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_2 object:self userInfo:@{@"abc":@(2)}];
}

@end
