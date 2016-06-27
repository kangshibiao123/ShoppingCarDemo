//
//  SettlementView.m
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "SettlementView.h"

@implementation SettlementView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self addUI];
    }
    return self;
    
}
- (void)addUI{
    
    CGFloat height = self.bounds.size.height;
    
    self.shoppingCart = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shoppingCart setImage:[UIImage imageNamed:@"gouwu"] forState:UIControlStateNormal];
    [self.shoppingCart addTarget:self action:@selector(shoppingCartClokc) forControlEvents:UIControlEventTouchUpInside];
    self.shoppingCart.frame = CGRectMake(20, 5, 30, 30);
    [self addSubview:self.shoppingCart];
    
    _number = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.shoppingCart.frame), 0, 16, 16)];
    _number.backgroundColor = [UIColor redColor];
    _number.textColor = [UIColor whiteColor];
    _number.font = [UIFont systemFontOfSize:12];
    _number.textAlignment = NSTextAlignmentCenter;
    _number.layer.masksToBounds = YES;
    _number.layer.cornerRadius = 8;
    [self addSubview:_number];
    
    _money = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_number.frame), 5, 130, 30)];
    _money.text = @"￥：0.00";
    _money.font = FONT(14);
    _money.textColor = [UIColor blackColor];
    [self addSubview:_money];
    
    _settlement =[UIButton buttonWithType:UIButtonTypeCustom];
    _settlement.frame =CGRectMake(Screen_wide - KS_W(80), 0, KS_W(80), height);
    _settlement.backgroundColor = HRGB;
    [_settlement setTitle:@"去结算" forState:UIControlStateNormal];
    [self addSubview:_settlement];
}
- (void)setNumber:(UILabel *)number{
    
    CGSize size = [_number.text boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_number.font} context:nil].size;
    CGRect rect = _number.frame;
    if (size.width >rect.size.width) {
        rect.size.width = size.width+6;
    }
    _number.frame = rect;
}
- (void)getNumber:(objc_objectptr_t **)buffer range:(NSRange)inRange{
    
}
#pragma mark --购物车
- (void)shoppingCartClokc{
    
}

@end
