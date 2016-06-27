//
//  ConfirmOrderVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/23.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "ConfirmOrderVC.h"

@interface ConfirmOrderVC ()

@end

@implementation ConfirmOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"确认订单";
    [self setLeftDefultWithNav];
}
#pragma mark -- 选择时间
- (IBAction)chooseTimer:(id)sender{
    __weak typeof(self) weakSelf = self;
//    KSPickView * pick =[[KSPickView alloc]initWithFrame:CGRectMake(0, 0, Screen_wide, Screen_heigth)];
//    pick.type = TYPE2;
//    pick.block = ^(NSString *name,NSInteger index){
//        
//        [weakSelf.timer setTitle:name forState:UIControlStateNormal];
//    };
//    pick.titArr =@[];
//    [pick show];
}
#pragma mark -- 选择地址
- (IBAction)addressBtn:(id)sender{
    
}
#pragma mark -- 确认订单
- (IBAction)confirmBtn:(id)sender{
    
    MetodPaymentVC *metod =[MetodPaymentVC new];

    [self.navigationController pushViewController:metod animated:YES];
}
#pragma mark -- UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    
    if (textView.text.length > 0) {
        
        self.msgPal.text = @"";
    }
    else{
        
        self.msgPal.text = @"您有什么需要叮嘱的请留下描述";
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
