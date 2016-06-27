//
//  ShoppingCartView.m
//  HSH
//
//  Created by kangshibiao on 16/5/20.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "ShoppingCartView.h"

@implementation ShoppingCartView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
    }
    return self;
}
- (void)setDatasArr:(NSMutableArray *)datasArr{
    
    _datasArr = datasArr;
    if (_datasArr.count == 0) {
        
        self.lableText.text = @"购物车为空";
    }
    [self.myTableView reloadData];
}
- (UITableView *)myTableView{
    
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 200, Screen_wide, 200) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerNib:[UINib nibWithNibName:@"ShoppingCartCell" bundle:nil] forCellReuseIdentifier:@"ShoppingCartCell"];
        [self addSubview:_myTableView];
   
        
    }
    return _myTableView;
}
- (UILabel *)lableText{
    
    if (!_lableText) {
        _lableText = [[UILabel alloc]init];
        _lableText.frame = CGRectMake(0, CGRectGetHeight(self.myTableView.frame)/2, Screen_wide, 40);
        _lableText.textAlignment = NSTextAlignmentCenter;
        _lableText.textColor = [UIColor lightGrayColor];
        _lableText.font = [UIFont systemFontOfSize:12];
        _lableText.numberOfLines = 0;
        [_myTableView addSubview:_lableText];

    }
    
    return _lableText;
    
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datasArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCartCell" forIndexPath:indexPath];
    [cell.addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.tag = indexPath.row;
    cell.deleteBtn.tag = indexPath.row;
    
    cell.data = self.datasArr[indexPath.row];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *vc = [UIView new];
    vc.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *lable =[[UILabel alloc]initWithFrame:CGRectMake(8, 0, 100, 30)];
    lable.text = @"购物车";
    lable.textAlignment = NSTextAlignmentLeft;
    lable.textColor = [UIColor blackColor];
    lable.font = [UIFont systemFontOfSize:16];
    [vc addSubview:lable];
    return vc;
}
- (void)addShoppingCartView:(UIViewController *)vc{
    _viewController = vc;
    [vc.view addSubview:self];
}
- (void)removeSubView:(UIViewController *)vc{
    UIView * v = [vc.view viewWithTag:111];
    [v removeFromSuperview];
    [self removeFromSuperview];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FootView" object:nil];
    [self removeSubView:_viewController];
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
    ShoppingCartCell * cell = (ShoppingCartCell *)indexPath.superview.superview;
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
    
    if (self.datasArr.count == 0) {
        
        self.lableText.text = @"当前购物车为空快去选购吧！";
    }
    _block(self.datasArr);
    
}
@end

