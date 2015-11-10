//
//  ViewController.m
//  FCUtility
//
//  Created by 123456 on 15/10/16.
//  Copyright © 2015年 fc. All rights reserved.
//

#import "ViewController.h"
#import "FCUtility.h"
#import "NSDate+FCFormatter.h"
#include <sys/time.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *dateStr = @"2015-11-04 23:59:59";
    NSString *timeStamp = [dateStr timeStamp:FC_yyyy_MM_dd_HH_mm_ss];

    CFAbsoluteTime d = CFAbsoluteTimeGetCurrent();

    struct timeval tv;
    gettimeofday(&tv,NULL);

    NSLog(@"-------->%lld", (long long) d);

    [FCUtility getCurrentMillisecond];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
