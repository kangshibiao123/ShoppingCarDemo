//
//  KSBaseViewController.h
//  HSH
//
//  Created by kangshibiao on 16/5/30.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSBaseViewController : UIViewController
/**
 *  左边返回按钮
 *  方法事件回调
 */
- (void)setLeftWithImage:(NSString *)imageName action:(SEL)action;
/**
 *  左边默认返回按钮图片
 *  没有回调方法
 */
- (void)setLeftDefultWithNav;

@end
