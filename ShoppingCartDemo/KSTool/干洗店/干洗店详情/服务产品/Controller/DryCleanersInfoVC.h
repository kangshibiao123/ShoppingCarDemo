//
//  DryCleanersInfoVC.h
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HedItemsView.h"
#import "SettlementView.h"
#import "PopTableView.h"
#import "SettlementVC.h"
#import "ShoppingCartView.h"
@interface DryCleanersInfoVC : UIViewController

@property (copy, nonatomic) NSString *navTitle;
////顶部菜单
//@property (strong, nonatomic)HedItemsView *mendView;
//底部菜单
@property (strong, nonatomic) SettlementView *settemntView;
//中间Tableview
@property (strong, nonatomic) PopTableView *popTableView;
//购物弹出来的视图
@property (strong, nonatomic) ShoppingCartView *shoppingCartView;
//购物车视图删除还是加载
@property (assign, nonatomic) BOOL isShopping;


@end
