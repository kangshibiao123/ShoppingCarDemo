//
//  ShoppingCartView.h
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCartCell.h"

typedef void(^orderBlock)(NSMutableArray *datasArr);
@interface ShoppingCartView : UIView<UITableViewDataSource,UITableViewDelegate>
- (instancetype)initWithFrame:(CGRect)frame;

@property(strong , nonatomic) NSMutableArray *datasArr;
@property(strong , nonatomic) UITableView *myTableView;
@property(strong , nonatomic) UIViewController *viewController;

@property (strong, nonatomic) orderBlock block;


@property (strong, nonatomic) UILabel *lableText;
// 添加
- (void)addShoppingCartView:(UIViewController *)vc;
//删除
- (void)removeSubView:(UIViewController *)vc;
@end
