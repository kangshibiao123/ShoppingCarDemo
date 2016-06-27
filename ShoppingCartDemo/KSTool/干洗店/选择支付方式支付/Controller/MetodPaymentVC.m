//
//  MetodPaymentVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/23.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "MetodPaymentVC.h"

@interface MetodPaymentVC ()

@end

@implementation MetodPaymentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title =@"付款中";
}
- (IBAction)selectPay:(UIButton *)sender{
    
    if (sender.tag == 0) {
        
        self.wx.image = [UIImage imageNamed:@"select"]
        ;
        self.ailpay.image = [UIImage imageNamed:@"select1"];
    }
    else{
        self.wx.image = [UIImage imageNamed:@"select1"]
        ;
        self.ailpay.image = [UIImage imageNamed:@"select"];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
