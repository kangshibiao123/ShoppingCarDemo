//
//  PopTableViewCell.h
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KButton : UIButton
@property(assign, nonatomic) NSInteger section;
@end

@interface PopTableViewCell : BaseTableViewCell
/**
 * 数量
 */
@property (weak, nonatomic)IBOutlet UILabel *number;
/**
 * 加加
 */
@property (weak, nonatomic) IBOutlet KButton *addBtn;
/**
 * 减去
 */
@property (weak, nonatomic) IBOutlet KButton *deleteBtn;
/**
 * 头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *hedImageView;
/**
 * 称呼
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 * 钱
 */
@property (weak, nonatomic) IBOutlet UILabel *money;

@property (strong, nonatomic) id data;


@end
