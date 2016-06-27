//
//  PopTableView.h
//  PopTableView
//
//  Created by mc on 15/11/11.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopTableViewCell.h"
#import "ShoppingCartModel.h"
typedef void(^orderShopping)(NSArray * datas);

@interface PopTableView : UIView <UITableViewDataSource,UITableViewDelegate>

- (id)initWithFrame:(CGRect)frame leftArr:(NSArray *)leftArr rightArr:(NSArray *)rightArr;

@property (strong,nonatomic) UITableView * leftTableView;

@property (strong,nonatomic) UITableView * rightTableView;

@property (strong, nonatomic) UIViewController *dry;

@property (strong, nonatomic) NSMutableArray * leftArr;
//
@property (strong, nonatomic) NSArray * rightArr;
/**
 * 当前点击的cell
 */
@property (assign, nonatomic) NSInteger seletIndx;
//抛物线红点
@property (strong, nonatomic) UIImageView *redView;
/**
 * 记录购物车里面的数据
 */
@property (strong, nonatomic) NSMutableArray *orderArr;





@end
