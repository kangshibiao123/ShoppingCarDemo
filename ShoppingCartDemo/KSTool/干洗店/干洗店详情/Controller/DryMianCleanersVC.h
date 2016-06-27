//
//  DryMianCleanersVC.h
//  HSH
//
//  Created by kangshibiao on 16/5/25.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DryCleanersInfoVC.h"
#import "HedItemsView.h"
#import "MerchantsVC.h"
//#import "EvaluationVC.h"
@interface DryMianCleanersVC : KSBaseViewController
@property (copy, nonatomic) NSString *navTitle;

//顶部菜单
@property (strong, nonatomic)HedItemsView *mendView;
@property (strong, nonatomic)UIScrollView *scrollView;

@end
