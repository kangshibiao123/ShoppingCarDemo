//
//  Header.h
//  KSTool
//
//  Created by mc on 16/3/17.
//  Copyright © 2016年 kangshibiao. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBCOLOR(r, g, b, a)         ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])

#define RGBSJ(r,g,b,a)  ([UIColor colorWithRed:arc4random()%r/255.0 green:arc4random()%g/255.0 blue:arc4random()%b/255.0 alpha:a])

#define KSDIC(dic,valuer) [dic valueForKey:valuer]==[NSNull null]?@"":[dic valueForKey:valuer]

//打印日志
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
#define Screen_wide    [UIScreen mainScreen].bounds.size.width
#define Screen_heigth  [UIScreen mainScreen].bounds.size.height
#define KSFO [UIFont systemFontOfSize:Screen_wide/320*14]
#define FONT(size) [UIFont systemFontOfSize:Screen_wide/320 * size]

#define KS_W(width) Screen_wide*(width/320.0)
#define KS_H(height) Screen_heigth*(height/480.0)

//黄色
#define HRGB ([UIColor colorWithRed:231/255.0 green:98/255.0 blue:29/255.0 alpha:1])

#endif /* Header_h */
