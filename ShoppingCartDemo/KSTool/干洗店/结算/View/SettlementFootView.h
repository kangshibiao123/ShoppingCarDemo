//
//  SettlementFootView.h
//  HSH
//
//  Created by kangshibiao on 16/5/23.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettlementFootView : UIView
+ (SettlementFootView *)initFootView;
/**
 * 金额
 */
@property (weak, nonatomic) IBOutlet UILabel *money;
/**
 * 件数
 */
@property (weak, nonatomic) IBOutlet UILabel *numbers;
/**
 * 确认
 */
@property (weak, nonatomic) IBOutlet UIButton *confirmOrder;



@end
