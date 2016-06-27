//
//  HedItemsView.h
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^hedBlcok)(UIButton *btn);

@interface HedItemsView : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuLayou;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ganLayou;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *quLayou;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@property (weak, nonatomic) IBOutlet UIView *moveView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leaging;
@property (copy, nonatomic) hedBlcok hedblock;
- (void)setSelectBtn:(int)tag;
+ (instancetype)initHedItesmView;

@end
