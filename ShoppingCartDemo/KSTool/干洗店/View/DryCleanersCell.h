//
//  DryCleanersCell.h
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DryCleanersCell : UITableViewCell
/**
 * 分享
 */
@property (weak, nonatomic) IBOutlet UIButton *share;
/**
 * 收藏
 */
@property (weak, nonatomic) IBOutlet UIButton *collection;
/**
 * 拨打电话
 */
@property (weak, nonatomic) IBOutlet UIButton *makePhone;
/**
 * 图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *hedImageView;
/**
 * 店家名字
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 * 地址
 */
@property (weak, nonatomic) IBOutlet UILabel *address;
/**
 * 价钱
 */
@property (weak, nonatomic) IBOutlet UILabel *money;
/**
 *  星星数组
 */
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *stars;



@end
