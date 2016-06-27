//
//  ShoppingCartModel.h
//  HSH
//
//  Created by kangshibiao on 16/6/16.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingCartModel : NSObject

@property (strong, nonatomic) NSString *money;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *urlHedImage;
@property (strong, nonatomic) NSString *orderCont;
- (instancetype)initWithDictionary:(id)dictionary;

+ (void)shoppingCartList:(id)data orderArr:(NSMutableArray *)orderArr;
/**
 *计算商品数量
 */
+ (NSInteger)orderShoppingCartr:(NSMutableArray *)orderArr;
/**
 * 计算商品价格
 */
+ (double)moneyOrderShoopingCart:(NSMutableArray *)orderArr;
@end
