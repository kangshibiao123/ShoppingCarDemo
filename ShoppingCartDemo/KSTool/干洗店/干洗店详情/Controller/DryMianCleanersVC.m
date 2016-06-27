//
//  DryMianCleanersVC.m
//  HSH
//
//  Created by kangshibiao on 16/5/25.
//  Copyright © 2016年 宋丰. All rights reserved.
//

#import "DryMianCleanersVC.h"

@interface DryMianCleanersVC ()<UIScrollViewDelegate>

@end

@implementation DryMianCleanersVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _navTitle;
    [self setLeftDefultWithNav];
    // Do any additional setup after loading the view from its nib.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addHedView];

    });
    
}
- (void)addHedView{
    __weak typeof(self)weakSelf = self;
    self.mendView = [HedItemsView initHedItesmView];
    self.mendView.frame = CGRectMake(0, 64, Screen_wide, KS_H(30));
    self.mendView.menuLayou.constant = 0;
    self.mendView.quLayou.constant = 0;
    self.mendView.ganLayou.constant = 0;
    self.mendView.imageView1.hidden = YES;
    self.mendView.imageView2.hidden = YES;
    self.mendView.imageView3.hidden = YES;
    self.mendView.label1.text = @"服务产品";
    self.mendView.label2.text = @"商家";
    self.mendView.label3.text = @"评价";
  
    self.mendView.hedblock = ^(UIButton *btn){
        [weakSelf.scrollView setContentOffset:CGPointMake(Screen_wide*(btn.tag-1), 0) animated:YES];
    };
    [self.view addSubview:self.mendView];
    [self addScrollView];
    
}
- (void)addScrollView{
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = CGRectMake(0, CGRectGetHeight(self.mendView.frame) + 64, Screen_wide, Screen_heigth - CGRectGetHeight(self.mendView.frame) - 64);
    self.scrollView.contentSize = CGSizeMake(Screen_wide *3, Screen_heigth - CGRectGetHeight(self.mendView.frame)-64);
    self.scrollView.contentOffset =  CGPointMake(0, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
    //所有产品

    DryCleanersInfoVC *dryInfo = [DryCleanersInfoVC new];
    dryInfo.view.frame = CGRectMake(0, 2, Screen_wide, self.scrollView.frame.size.height-2);
    [self.scrollView addSubview:dryInfo.view];
    [self addChildViewController:dryInfo];
    //商家
    MerchantsVC *merch = [MerchantsVC new];
    merch.view.frame = CGRectMake(Screen_wide, 2, Screen_wide, self.scrollView.frame.size.height -2);
    [self.scrollView addSubview:merch.view];
    [self addChildViewController:merch];
    //评价
//    EvaluationVC *evalu = [EvaluationVC new];
//    evalu.view.frame = CGRectMake(Screen_wide*2, 2, Screen_wide, self.scrollView.frame.size.height -2);
//    evalu.type = 1;
//    [self.scrollView addSubview:evalu.view];
//    [self addChildViewController:evalu];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSLog(@"--");
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"ds");
    int x = scrollView.contentOffset.x/Screen_wide;
    
    [self.mendView setSelectBtn:x+1];
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
