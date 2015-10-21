//
//  ViewController.m
//  FCUtility
//
//  Created by 123456 on 15/10/16.
//  Copyright © 2015年 fc. All rights reserved.
//

#import "ViewController.h"
#import "FCUtility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     NSString *str=  [[FCUtility utility]dirDoc];
    NSString *string = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
