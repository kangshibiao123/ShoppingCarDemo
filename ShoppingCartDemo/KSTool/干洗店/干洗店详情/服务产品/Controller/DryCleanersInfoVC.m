//
//  DryCleanersInfoVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/19.
//  Copyright © 2016年 宋丰. All rights reserved.
//



#import "DryCleanersInfoVC.h"
#import "ShoppingCartModel.h"
@interface DryCleanersInfoVC ()

@end

@implementation DryCleanersInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.title = self.navTitle;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self addHedView];
        [self addFootView];
        [self intTableView];
        [self gitPopDatas];


    });

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(isSlecte) name:@"FootView" object:nil];
}
- (void)gitPopDatas{
    
    [KSRequestManager postRequestWithUrlString:@"http://client.waimai.baidu.com/shopui/na/v1/shopmenu?da_ext=&msgcuid=&utm_term=default&net_type=wifi&utm_source=waimai&address=%E5%92%8C%E8%8C%82%E5%A4%A7%E5%8E%A6&screen=414x736&cheatios=hss4mYcfcem0%2FdWMCp3lPvF0i4U0o3IMPwZ4wuMg2%2Fzj42AKUWy%2FA4dSb%2BhnZ%2BCDf123hmxaPE%2Fkg7tjOcmFX4iYACTUdYNujEyynthXXEau7vS8brgXnGgQlwO1uyr7LM4tkO2S7sJ68fx9d104Nh4dYHyvsKyzNd7tdF2PtiT6bi0sTSSuhYiwFdPo3eTvj7qyO%2FKbJlE7et9KsKB7fuKZSX6ExfUrnQMaEetAYtnD2noA5UaW91bFYOkADNGFsoctVXcqYCYRQ6%2Bl6A1lZjGqk2KFcWmMtyVlAYuLIG3VY09ishzYPzc8tUk7Q%2FWRQ2wpDSJiCjSioQMrVdXunQ%3D%3D&cuid=AFBAAE26-4F36-43A9-BD95-D7A04CD5E73A&hot_fix=0&uuid=1805C0E5-C060-4787-9663-C189F01B7364&sv=3.8.0&shop_id=1524409677&isp=46002&channel=appstore&loc_lng=13394915.084294&resid=1001&from=na-iphone&order_id=&request_time=1465891620414&model=iPhone7%2C1&lng=13394804.520000&idfa=&utm_medium=shoplist&cid=988272&os=9.3.2&lat=3523303.970000&loc_lat=3523194.397325&city_id=179&utm_content=default&vmgdb=&jailbreak=0&device_name=FaithiPhone&utm_campaign=default" parameter:nil success:^(id responseObject)
    {
    
        NSArray * arr = [[responseObject valueForKey:@"result"] valueForKey:@"takeout_menu"];

        NSMutableArray *bigArr = [NSMutableArray array];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:obj];
            NSArray * arr1 = mutableDic[@"data"];

            NSMutableArray * small = [NSMutableArray array];
            
            [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSMutableDictionary * dic = [NSMutableDictionary dictionaryWithDictionary:obj];
                
                [dic setObject:@"0" forKey:@"orderCont"];
                
                [small addObject:dic];
                
                
            }];
            
            [mutableDic setObject:small forKey:@"data"];
            [bigArr addObject:mutableDic];
        }];
        
        self.popTableView.leftArr = bigArr;

    } failure:^(NSError *error) {
        
        NSLog(@"---%@",error);
    }];
}
- (void)isSlecte{
    
    _isShopping = NO;
}
- (void)addFootView{
    
    self.settemntView = [[SettlementView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - KS_W(35), Screen_wide, KS_W(35))];
    self.settemntView.number.text = @"0";
    [self.settemntView.settlement addTarget:self action:@selector(settlementClock) forControlEvents:UIControlEventTouchUpInside];
    [self.settemntView.shoppingCart addTarget:self action:@selector(shoppingCartClock) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_settemntView];
    
}
- (void)intTableView{

    self.popTableView = [[PopTableView alloc]initWithFrame:CGRectMake(0, 0, Screen_wide, self.view.bounds.size.height - KS_W(35)) leftArr:nil rightArr:nil];
    self.popTableView.dry = self;
    
    [self.view addSubview:self.popTableView];
}
#pragma mark -- 去结算
- (void)settlementClock{
    
    __weak typeof(self) weakSelf = self;

    SettlementVC *settlement = [SettlementVC new];
    settlement.datasArr = self.popTableView.orderArr;
    settlement.GoBack = ^{
        
        [weakSelf updateShoppingCart:self.popTableView.orderArr];

    };
    [self.navigationController pushViewController:settlement animated:YES];
}
#pragma mark -- 购物车按钮
- (void)shoppingCartClock{

    __weak typeof(self) weakSelf = self;

    if (!_isShopping)
    {
        self.shoppingCartView =[[ShoppingCartView alloc]init];
        self.shoppingCartView.frame =CGRectMake(0, Screen_heigth, Screen_wide,self.view.bounds.size.height-CGRectGetHeight(self.settemntView.frame));

        UIView *bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_wide,self.view.bounds.size.height-CGRectGetHeight(self.settemntView.frame))];
        bgView.alpha = .7;
        bgView.tag = 111;
        bgView.backgroundColor =[UIColor lightGrayColor];
        [self.view addSubview:bgView];
        self.shoppingCartView.block = ^(NSMutableArray *darasArr){
            
            [weakSelf updateShoppingCart:darasArr];
        };
        
        [self.shoppingCartView addShoppingCartView:self];
        [UIView animateWithDuration:.3 animations:^{
            
            self.shoppingCartView.frame =CGRectMake(0, 0, Screen_wide,self.view.bounds.size.height-CGRectGetHeight(self.settemntView.frame));
            self.shoppingCartView.datasArr = self.popTableView.orderArr;
        } completion:^(BOOL finished)
        {
            
            
        }];

    }
    else{
       
        [self.shoppingCartView removeSubView:self];
    }
    _isShopping = !_isShopping;
    
}
#pragma mark -- 更新 数量 价钱
- (void)updateShoppingCart:(NSMutableArray *)darasArr{
    
    __weak typeof(self) weakSelf = self;

    weakSelf.settemntView.number.text  = [NSString stringWithFormat:@"%ld",(long)[ShoppingCartModel orderShoppingCartr:darasArr]];
    weakSelf.settemntView.money.text = [NSString stringWithFormat:@"￥%.2f",[ShoppingCartModel moneyOrderShoopingCart:darasArr]];
    
    [weakSelf.popTableView.rightTableView reloadData];
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
