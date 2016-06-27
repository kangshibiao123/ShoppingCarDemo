//
//  SettlementCell.m
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "SettlementCell.h"

@implementation SettlementCell

- (void)awakeFromNib {
    // Initialization code
    [self.number.layer setBorderWidth:.5];
    [self.number.layer setBorderColor:HRGB.CGColor];
    self.number.text = @"0";
    self.name.font = FONT(12);
    self.money.font = FONT(12);
}
- (void)setData:(id)data{
    
    self.name.text = KSDIC(data, @"name");
    
    self.money.text = [NSString stringWithFormat:@"￥%@/件",KSDIC(data, @"current_price")];
    self.number.text = [NSString stringWithFormat:@"%@",KSDIC(data, @"orderCont")];

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
