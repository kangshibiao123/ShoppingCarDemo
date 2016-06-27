//
//  ShoppingCartCell.h
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartCell : BaseTableViewCell
/**
 * 数量
 */
@property (weak, nonatomic)IBOutlet UILabel *number;

/**
 * 加加
 */
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

/**
 * 减去
 */
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

/**
 * 名称
 */
@property (weak, nonatomic) IBOutlet UILabel *name;

/**
 * 价钱
 */
@property (weak, nonatomic)IBOutlet UILabel *money;

/**
 * 多少件
 */
@property (weak, nonatomic) IBOutlet UILabel *pageNumebr;

/**
 * 数据源
 */
@property (strong, nonatomic) id data;
@end
