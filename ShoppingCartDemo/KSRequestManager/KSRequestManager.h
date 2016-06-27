//
//  KSRequestManager.h
//  HSH
//
//  Created by kangshibiao on 16/6/14.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
//#import "JCProgressHUD.h"
@interface KSRequestManager : NSObject
/**
 *
 */
+ (void)postRequestWithUrlString:(NSString *)url
                       parameter:(id)parameter
                         success:(void (^)(id responseObject))success
                         failure:(void (^) (NSError *error))failure;

@end
