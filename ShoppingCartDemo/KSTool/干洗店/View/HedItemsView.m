//
//  HedItemsView.m
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "HedItemsView.h"

@implementation HedItemsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)initHedItesmView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HedItemsView" owner:nil options:nil]lastObject];
}
- (IBAction)chooseBtn:(UIButton *)sender{
    
    [self setSelectBtn:sender.tag];
       if (self.hedblock) {
        
        self.hedblock(sender);
    }
    
}
- (void)setSelectBtn:(int)tag{
    self.leaging.constant = (Screen_wide/3)*(tag - 1);

    if (tag == 1) {
        self.imageView1.image = [UIImage imageNamed:@"xiajiao"];
        self.imageView2.image = [UIImage imageNamed:@"guaijiao"];
        self.imageView3.image = [UIImage imageNamed:@"guaijiao"];
        self.label1.textColor = HRGB;
        self.label2.textColor = [UIColor blackColor];
        self.label3.textColor = [UIColor blackColor];
    }
    else if (tag == 2)
    {
        self.imageView2.image = [UIImage imageNamed:@"xiajiao"];
        self.imageView1.image = [UIImage imageNamed:@"guaijiao"];
        self.imageView3.image = [UIImage imageNamed:@"guaijiao"];
        self.label2.textColor = HRGB;
        self.label1.textColor = [UIColor blackColor];
        self.label3.textColor = [UIColor blackColor];
    }
    else{
        self.imageView3.image = [UIImage imageNamed:@"xiajiao"];
        self.imageView2.image = [UIImage imageNamed:@"guaijiao"];
        self.imageView1.image = [UIImage imageNamed:@"guaijiao"];
        self.label3.textColor = HRGB;
        self.label2.textColor = [UIColor blackColor];
        self.label1.textColor = [UIColor blackColor];
    }

}

@end
