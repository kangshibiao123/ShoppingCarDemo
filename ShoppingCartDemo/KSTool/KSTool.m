//
//  KSTool.m
//  KSTool
//
//  Created by mc on 16/3/12.
//  Copyright © 2016年 kangshibiao. All rights reserved.
//

#import "KSTool.h"

@implementation KSTool
+ (NSString *)setTimeFormat:(double)timer{
    
    if (timer<=0) {
        
        return @"";
    }
    NSDate * date = [[NSDate alloc]initWithTimeIntervalSince1970:timer/1000];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [dateFormatter stringFromDate:date];
}
+ (NSString *)setTimeStyle:(NSString *)style timer:(double)timer{
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:timer/100];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:style];
    
    return [dateFormatter stringFromDate:date];
    
}
+ (double)gitTimeIntervalText:(NSString *)text{
    
    if ([text isEqualToString:@""]||text == nil) {
        
        return 0;
    }
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date =[dateFormatter dateFromString:text];
    
    NSTimeInterval  timerInt =[date timeIntervalSince1970]*1000;
    
    return timerInt;
}
+ (NSString *)SeparatdeValuer:(NSString *)valuer content:(NSString *)content{
    
    NSArray * arr = [content componentsSeparatedByString:valuer];

    return [arr lastObject];
}
+ (CGSize)sizeWithTexte:(NSString *)text font:(UIFont *)font maxSize:(CGSize)size{
    
    return [text boundingRectWithSize:size
                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
}
+ (BOOL )dictionaryWith:(NSDictionary *)dic key:(NSString *)key{
    
    if ([[dic allKeys]containsObject:key]) {
        
        return YES;
    }
    return NO;
}
+ (void)alertViewWithController:(UIViewController *)controller
                          title:(NSString *)title
                        message:(NSString *)message
                          items:(NSArray *)itesm
                          style:(UIAlertControllerStyle )style
                            idx:(void (^)(NSInteger indx))idx{

    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    
    [itesm enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:itesm[idx1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            idx(idx1);
        }];
        [alertController addAction:action];
        
    }];
   
    
    
    [controller presentViewController:alertController animated:YES completion:nil];
}
+ (void)showKey:(UIView *)view{
    
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    key.duration = .5;
    
    NSMutableArray * values= [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];

    key.values =values;
    [view.layer addAnimation:key forKey:nil];

}
+ (void)callPhone:(NSString *)phone{
    
    if (phone == nil||[phone isEqualToString:@""]) {
        NSLog(@"电话号码为空");
        return;
    }
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel://" stringByAppendingString:phone]]];
    
}
+ (NSString*)dateTransformString:(long long)ts
{
    NSDate *d=[[NSDate alloc]initWithTimeIntervalSince1970:ts];
    NSTimeInterval late = [d timeIntervalSince1970]*1;
    
    NSString * timeString = nil;
    
    
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
    
    NSTimeInterval now = [dat timeIntervalSince1970]*1;
    
    NSTimeInterval cha = now - late;
    if (cha/3600 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/60];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num= [timeString intValue];
        
        if (num < 1) {
            timeString = [NSString stringWithFormat:@"刚刚..."];
            
        }else{
            timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
        }
        
    }else if (cha/3600 > 1 && cha/86400 < 1) {
        
        timeString = [NSString stringWithFormat:@"%f", cha/3600];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        timeString = [NSString stringWithFormat:@"%@小时前", timeString];
        
    }else if (cha/86400 > 1){
        
        timeString = [NSString stringWithFormat:@"%f", cha/86400];
        
        timeString = [timeString substringToIndex:timeString.length-7];
        
        int num = [timeString intValue];
        
        if (num < 2) {
            
            timeString = [NSString stringWithFormat:@"昨天"];
            
        }else if(num == 2){
            
            timeString = [NSString stringWithFormat:@"前天"];
            
        }else if (num > 2 && num <7){
            
            timeString = [NSString stringWithFormat:@"%@天前", timeString];
            
        }else if (num >= 7 && num <= 30) {
            
            timeString = [NSString stringWithFormat:@"%d周前",num/7];
            
        }else if(num > 30 && num <= 360){
            
            timeString = [NSString stringWithFormat:@"%d月前",num/30];
            
        }else if(num > 360)
        {
            timeString = [NSString stringWithFormat:@"1年前"];
            
        }
    }
    return timeString;
}
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    if (mobileNum==nil) {
        return NO;
    }
//    "^(((13[0-9]{1})|(15[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\\d{8})$"
    
    NSString *ALL = @"^(((13[0-9]{1})|(15[0-9]{1})|(14[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\\d{8})$";

    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom 
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestall = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ALL];
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES)
        || ([regextestall evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//检查银行卡是否合法

+ (BOOL) checkCardNo:(NSString*) cardNo{
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}
//身份证号
+ (BOOL)validateIdentityCard:(NSString *)identityCard
{
    if (identityCard.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[identityCard substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[identityCard substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[identityCard substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

+ (void)ipadCamereWithConeroller:(id)viewController SourceType:(UIImagePickerControllerSourceType)SourceType{
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        
    {
        if (SourceType == UIImagePickerControllerSourceTypeCamera) {
            
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                NSLog(@"模拟器不支持相机");
                return;
            }
        }
        
//        ipc.mediaTypes =[UIImagePickerController availableMediaTypesForSourceType:ipc.sourceType];
    }
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = SourceType;

    ipc.delegate = viewController;
    
//    ipc.allowsEditing = YES;
    
    [viewController presentViewController:ipc animated:YES completion:nil];
}

@end
