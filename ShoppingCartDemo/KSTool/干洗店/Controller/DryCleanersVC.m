//
//  DryCleanersVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "DryCleanersVC.h"

@interface DryCleanersVC ()

@end

@implementation DryCleanersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView];
    [self setLeftDefultWithNav];
}
- (void)initTableView{
    self.title = @"所有商店";
    [self.myTableView registerNib:[UINib nibWithNibName:@"DryCleanersCell" bundle:nil] forCellReuseIdentifier:@"DryCleanersCell"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"HedItemsView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"HedItemsView"];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    DryCleanersCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DryCleanersCell" forIndexPath:indexPath];
    [cell.share addTarget:self action:@selector(shareClcok:) forControlEvents:UIControlEventTouchUpInside];
    [cell.collection addTarget:self action:@selector(collectionClock:) forControlEvents:UIControlEventTouchUpInside];
    [cell.makePhone addTarget:self action:@selector(makePhoneClock:) forControlEvents:UIControlEventTouchUpInside];
    cell.share.tag = indexPath.row;
    cell.collection.tag = indexPath.row;
    cell.makePhone.tag = indexPath.row;
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DryMianCleanersVC *dryCleaners = [DryMianCleanersVC new];
    dryCleaners.navTitle  =@"干洗店";
    [self.navigationController pushViewController:dryCleaners animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 123;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return section == 0?KS_H(33):8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return .1;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        HedItemsView *view = [HedItemsView initHedItesmView];
        
        return view;
    }
    else{
        return nil;
    }
 
}
#pragma mark -- 分享
- (void)shareClcok:(UIButton *)sender{
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:@""
//                                      shareText:[NSString stringWithFormat:@""]
//                                     shareImage:[UIImage imageNamed:@"lognRed"]
//                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQzone,UMShareToQQ]
//                                       delegate:self];

}
#pragma mark -- 收藏
- (void)collectionClock:(UIButton *)sender{
    
}
#pragma mark -- 拨打电话
- (void)makePhoneClock:(UIButton *)sender{
    
    [KSTool callPhone:@""];
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
