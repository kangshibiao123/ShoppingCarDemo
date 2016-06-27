//
//  KSRequestManager.m
//  HSH
//
//  Created by kangshibiao on 16/6/14.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "KSRequestManager.h"

@implementation KSRequestManager
+ (void)postRequestWithUrlString:(NSString *)url
                       parameter:(id)parameter
                         success:(void (^)(id responseObject))success
                         failure:(void (^) (NSError *error))failure{
    
    AFHTTPRequestOperationManager *manager= [AFHTTPRequestOperationManager manager];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];

    [manager POST:[NSString stringWithFormat:@"%@",url] parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
//        [JCProgressHUD showErrorWithStatus:@"网络连接失败！"];
        failure(error);
    }];
}

@end
