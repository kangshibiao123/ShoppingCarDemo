//
//  SettlementVC.h
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettlementCell.h"
#import "SettlementFootView.h"
#import "ConfirmOrderVC.h"
@interface SettlementVC : KSBaseViewController
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

/**
 *  数据源
 */
@property (strong, nonatomic) NSMutableArray *datasArr;

/**
 * 更新数量与价格
 */
@property (copy, nonatomic) void((^GoBack)());





@end
