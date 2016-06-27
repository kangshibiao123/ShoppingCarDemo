//
//  ViewController.m
//  ShoppingCartDemo
//
//  Created by kangshibiao on 16/6/21.
//  Copyright © 2016年 ZJTRRJ. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate * window = [UIApplication sharedApplication].delegate;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        window.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[DryCleanersVC new]];
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
