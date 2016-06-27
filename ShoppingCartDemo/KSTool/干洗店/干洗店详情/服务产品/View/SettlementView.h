//
//  SettlementView.h
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettlementView : UIView
- (instancetype)initWithFrame:(CGRect)frame;
/**
 * 购物车按钮
 */
@property (strong, nonatomic) UIButton *shoppingCart;
/**
 * 数量
 */
@property (strong, nonatomic) UILabel *number;
/**
 * 价钱
 */
@property (strong, nonatomic) UILabel *money;
/*
 * 去结算
 */
@property (strong, nonatomic) UIButton *settlement;

@end
