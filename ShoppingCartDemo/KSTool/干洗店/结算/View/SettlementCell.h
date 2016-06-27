//
//  SettlementCell.h
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettlementCell : UITableViewCell
/**
 * 数量
 */
@property (weak, nonatomic)IBOutlet UILabel *number;
/**
 * 称呼
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 * 钱
 */
@property (weak, nonatomic) IBOutlet UILabel *money;

/**
 * 加加
 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/**
 * 减去
 */
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (strong, nonatomic) id data;

@end
