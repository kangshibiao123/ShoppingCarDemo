//
//  SettlementFootView.m
//  HSH
//
//  Created by kangshibiao on 16/5/23.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "SettlementFootView.h"

@implementation SettlementFootView

+ (SettlementFootView *)initFootView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"SettlementFootView" owner:nil options:nil]lastObject];
}


@end
