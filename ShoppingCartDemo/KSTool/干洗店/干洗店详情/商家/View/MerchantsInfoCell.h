//
//  MerchantsInfoCell.h
//  HSH
//
//  Created by kangshibiao on 16/5/25.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MerchantsInfoCell : BaseTableViewCell
/**
 * 图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *hedImageView;
/**
 * 名称
 */
@property (weak, nonatomic) IBOutlet UILabel *name;
/**
 * 响应时间
 */
@property (weak, nonatomic) IBOutlet UILabel *timer;
/**
 * 电话
 */
@property (weak, nonatomic) IBOutlet UIButton *phone;
/**
 * 服务质量
 */
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *quality;
/**
 * 服务速度
 */
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *speed;
@end
