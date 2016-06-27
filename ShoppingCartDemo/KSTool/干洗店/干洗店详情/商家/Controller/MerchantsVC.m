//
//  MerchantsVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/25.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "MerchantsVC.h"

@interface MerchantsVC ()

@end

@implementation MerchantsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self iniTab];
}
- (void)iniTab{
    [self.myTableView registerNib:[UINib nibWithNibName:@"MerchantsInfoCell" bundle:nil] forCellReuseIdentifier:@"MerchantsInfoCell"];
    
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
       
        MerchantsInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MerchantsInfoCell" forIndexPath:indexPath];
        
        return cell;
    }
    else{
        static NSString * cellInde;
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellInde];        ;
        if (!cell) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInde];
        }
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text  =@"抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁";
        return cell;
    }
   
    
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return KS_H(100);
    }
    else{
        CGSize size =[KSTool sizeWithTexte:@"抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁抽刀断水水更流举杯消愁愁更愁" font:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(Screen_wide - 32, MAXFLOAT)];
        return ceilf(size.height)+10;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
