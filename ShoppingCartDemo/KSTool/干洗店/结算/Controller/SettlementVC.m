//
//  SettlementVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "SettlementVC.h"
#import "ShoppingCartModel.h"
@interface SettlementVC ()
{
    SettlementFootView *_footView;
}
@end

@implementation SettlementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initTab];
  
    [self setLeftWithImage:nil action:@selector(backGo)];
    
    
}
- (void)backGo{
    
    self.GoBack();
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)initTab{
    self.title = @"结算";
    [self.myTableView registerNib:[UINib nibWithNibName:@"SettlementCell" bundle:nil] forCellReuseIdentifier:@"SettlementCell"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SettlementFootView" bundle:nil] forCellReuseIdentifier:@"SettlementFootView"];
}
#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datasArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SettlementCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettlementCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = indexPath.row;
    cell.deleteBtn.tag = indexPath.row;

    cell.data = self.datasArr [indexPath.row];
    
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return KS_H(44);
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return KS_H(200);
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    _footView = [SettlementFootView initFootView];
    [_footView.confirmOrder addTarget:self action:@selector(confirmOrderClock) forControlEvents:UIControlEventTouchUpInside];
    _footView.money.text = [NSString stringWithFormat:@"￥%.2f",[ShoppingCartModel moneyOrderShoopingCart:self.datasArr]];
    _footView.numbers.text = [NSString stringWithFormat:@"共计%ld件",(long)[ShoppingCartModel orderShoppingCartr:self.datasArr]];
    
    return _footView;
}
#pragma mark -- confirmOrderClock
- (void)confirmOrderClock{
    
    ConfirmOrderVC *confirm = [ConfirmOrderVC new];
    
    [self.navigationController pushViewController:confirm animated:YES];
}
#pragma markl -- 加加
- (void)addBtn:(UIButton *)sender{
    
    [self updatesContNumber:sender addAndDele:YES];
}
#pragma mark -- 减减
- (void)deleteBtn:(UIButton *)sender{
    
    [self updatesContNumber:sender addAndDele:NO];
    
}
- (void)updatesContNumber:(UIButton *)indexPath addAndDele:(BOOL)isAD{
    
    //    ShoppingCartCell *cell = [self.myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.tag inSection:0]];
    SettlementCell * cell = (SettlementCell *)indexPath.superview.superview;
    NSIndexPath *indx = [self.myTableView indexPathForCell:cell];
    int num = [cell.number.text intValue];
    
    if (isAD) {
        
        num ++;
    }
    else{
        
        num --;
    }
    
    cell.number.text = [NSString stringWithFormat:@"%d",num];
    
    NSMutableDictionary * data  =self.datasArr[indx.row];
    
    [data setObject:@(num) forKey:@"orderCont"];
    
    if (num == 0) {
        
        
        
        [self.datasArr removeObject:data];
        
        [self.myTableView deleteRowsAtIndexPaths:@[indx] withRowAnimation:0];
    }
    
    _footView.money.text = [NSString stringWithFormat:@"￥%.2f",[ShoppingCartModel moneyOrderShoopingCart:self.datasArr]];
    _footView.numbers.text = [NSString stringWithFormat:@"共计%ld件",(long)[ShoppingCartModel orderShoppingCartr:self.datasArr]];

    
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
