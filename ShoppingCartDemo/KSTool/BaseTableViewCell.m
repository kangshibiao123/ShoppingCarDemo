//
//  BaseTableViewCell.m
//  HSH
//
//  Created by kangshibiao on 16/5/25.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    // Configure the view for the selected state
}

@end
