//
//  PopTableViewCell.m
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "PopTableViewCell.h"

@implementation KButton

@synthesize section;

@end

@implementation PopTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
//    /Users/fuxingrun/Desktop/HSH/HSH/ThirdParty/imageView/Assets/ImagesPicker.xcassets/images/assets_placeholder_picture.imageset/assets_placeholder_picture@2x.png
}
- (void)setData:(id)data{
    
    [self.hedImageView sd_setImageWithURL:[NSURL URLWithString:@"http://webmap1.map.bdimg.com/maps/services/thumbnails?align=middle%2Cmiddle&quality=100&width=285&height=285&src=http%3A%2F%2Fimg.waimai.bdimg.com%2Fpb%2F091a222aaee9dd32daed8c83407bcd0051"] placeholderImage:[UIImage imageNamed:@"assets_placeholder_picture"]];
    self.name.text = KSDIC(data, @"name");
    
    self.money.text = [NSString stringWithFormat:@"￥%@/件",KSDIC(data, @"current_price")];
    self.number.text = [NSString stringWithFormat:@"%@",KSDIC(data, @"orderCont")];
    //
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
