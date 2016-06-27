//
//  ConfirmOrderVC.h
//  HSH
//
//  Created by kangshibiao on 16/5/23.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetodPaymentVC.h"
//#import "KSPickView.h"
@interface ConfirmOrderVC : KSBaseViewController
/**
 * 手机号码
 */
@property (weak, nonatomic) IBOutlet UITextField *phone;
/**
 * 地址
 */
@property (weak, nonatomic) IBOutlet UIButton *address;
/**
 * 留言
 */
@property (weak, nonatomic) IBOutlet UITextView *message;
/**
 *
 */
@property (weak, nonatomic) IBOutlet UILabel *msgPal;
/**
 * 时间
 */
@property (weak, nonatomic) IBOutlet UIButton *timer;

@end
