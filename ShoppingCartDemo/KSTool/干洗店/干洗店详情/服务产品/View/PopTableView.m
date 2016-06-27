//
//  PopTableView.m
//  PopTableView
//
//  Created by mc on 15/11/11.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "PopTableView.h"
#import "DryCleanersInfoVC.h"


@interface PopTableView ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>

@property BOOL isleft;

@end


@implementation PopTableView

{
    CALayer *_layer;
    NSInteger _cnt;
    
}

- (id)initWithFrame:(CGRect)frame leftArr:(NSArray *)leftArr rightArr:(NSArray *)rightArr{
    
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

/**
 *  抛物线小红点
 *
 *  @return
 */
- (UIImageView *)redView
{
    if (!_redView) {
        _redView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _redView.image = [UIImage imageNamed:@"adddetail"];
        _redView.layer.cornerRadius = 10;
    }
    return _redView;
}
//数据源
- (void)setLeftArr:(NSMutableArray *)leftArr{
    
    _leftArr = leftArr;

    
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];

}

//- (void)setRightArr:(NSArray *)rightArr{
//    
//    _rightArr = rightArr;
//    [self.rightTableView reloadData];
//}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    _leftTableView.frame = CGRectMake(0, 0, self.frame.size.width/4,self.bounds.size.height);
    _rightTableView.frame = CGRectMake(CGRectGetMaxX(_leftTableView.frame), 0,Screen_wide - CGRectGetWidth(_leftTableView.frame),self.bounds.size.height);
}

/**
 * 左边表
 */
- (UITableView *)leftTableView{
    
    if (!_leftTableView ) {
        
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/4,0) style:UITableViewStylePlain];
        
        _leftTableView.delegate = self;
        
        _leftTableView.dataSource = self;
        _leftTableView.tag = 100;
        [_leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        _leftTableView.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
        [self addSubview:_leftTableView];

    }
    return _leftTableView;
    
}

/**
 * 右边标
 */
- (UITableView *)rightTableView{
    
    if (!_rightTableView) {
        
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftTableView.frame), 0,Screen_wide - CGRectGetWidth(_leftTableView.frame),0) style:UITableViewStylePlain];
        [_rightTableView registerNib:[UINib nibWithNibName:@"PopTableViewCell" bundle:nil] forCellReuseIdentifier:@"PopTableViewCell"];
        _rightTableView.backgroundColor = [UIColor grayColor];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.tag =200;
        [self addSubview:_rightTableView];
   
   
    }
    return _rightTableView;
}



#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag == 100) {
        
        
        return _leftArr.count;
    }
    else{
        
//        return [_leftArr[section] count];
        id data =self.leftArr[section];
        
        NSArray * arr = [data valueForKey:@"data"];
        
        return arr.count;
    }
//    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (tableView.tag !=100) {
        return [_leftArr count];

    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.leftTableView == tableView) {
        static NSString * index = @"";
        
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:index];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:index];
        }
        
        if (_seletIndx == indexPath.row)
        {
            
            cell.backgroundColor = [UIColor redColor];
        }
        else{
            cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        }
        id data = self.leftArr[indexPath.row];
        cell.textLabel.text = KSDIC(data, @"catalog");
        
        cell.textLabel.font = [UIFont systemFontOfSize:11];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

    }
    else{
        
        PopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PopTableViewCell" forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.addBtn addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell.deleteBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        cell.addBtn.tag = indexPath.row;
        cell.deleteBtn.tag = indexPath.row;
        cell.addBtn.section = indexPath.section;
        cell.deleteBtn.section = indexPath.section;
        
//        NSDictionary *dic = [self.sectionDictionary valueForKey:[NSString stringWithFormat:@"%ld",indexPath.section]];
//        if (dic)
//        {
//            if ([dic valueForKey:[NSString stringWithFormat:@"%ld",indexPath.row]] == nil)
//            {
//                cell.number.text = @"0";
//            }
//            else{
//                
//                cell.number.text = [NSString stringWithFormat:@"%@",[dic valueForKey:[NSString stringWithFormat:@"%ld",indexPath.row]]];
//                
//            }
// 
//        }
//        else{
//            cell.number.text = @"0";
//        }
//        
        
        id data =self.leftArr[indexPath.section];
        
        NSArray * arr = [data valueForKey:@"data"];
        
        cell.data = arr[indexPath.row];
        return cell;
    }
    
    
}


#pragma mark --- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 100) {
        self.isleft = YES;
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [self.leftTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];

        _seletIndx= indexPath.row;
        [self.leftTableView reloadData];
    }
    else{
        self.isleft = NO;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (self.rightTableView == tableView)
    {
        
        return 10.0f;
    }
    return .1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return .1f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return KS_H(50);
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    if (self.rightTableView.tracking) {
        self.isleft = NO;
        NSLog(@"no");
    }else if (self.leftTableView.tracking){
        self.isleft = YES;
          NSLog(@"yes");
    }
    
    
    
    if (!self.isleft) {
        
        if (scrollView.tag !=100) {
            
            NSIndexPath *path =  [self.rightTableView indexPathForRowAtPoint:CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y)];
            
            if (path)
            {                //
                [self.leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:path.section inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
                
                UITableViewCell *cell = [self.leftTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:path.section inSection:0]];
                
                cell.backgroundColor = [UIColor redColor];
                _seletIndx = path.section ;
                [self.leftTableView reloadData];
                
            }
        }

    }
    
}

- (NSMutableArray *)orderArr{
    
    if (!_orderArr) {
        
        _orderArr = [NSMutableArray array];
    }
    return _orderArr;
}
#pragma mark --加加
- (void)addBtn:(KButton *)sender{
    
   PopTableViewCell *cell = [self popCell:[NSIndexPath indexPathForRow:sender.tag inSection:sender.section]];
    
    int num = [cell.number.text intValue];
    
    num ++;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:sender.section];
    
    [self updateShoppingCart:indexPath];
    
    [self setNum:num index:indexPath];
}
// 添加购物车
- (void)updateShoppingCart:(NSIndexPath *)indexPath{
    
    id data = self.leftArr[indexPath.section];
    
    NSArray * arr = [data valueForKey:@"data"];
    
    id data1 = arr[indexPath.row];
    
    if (self.orderArr.count != 0)
    {
        BOOL flage = YES;
        for (NSDictionary *dic in self.orderArr)
        {
            if (dic[@"item_id"]==data1[@"item_id"])
            {
                
                flage = NO;
                break;
            }
        }
        if (flage)
        {
            
            [self.orderArr addObject:data1];
        }
    }
    else{
        
        [self.orderArr addObject:data1];
        
    }
    
    NSLog(@"---%d",self.orderArr.count);
}

#pragma mark --减减
- (void)deleteBtn:(KButton *)sender{
    
    
    PopTableViewCell *cell = [self popCell:[NSIndexPath indexPathForRow:sender.tag inSection:sender.section]];
    
    int num = [cell.number.text intValue];
    if (num == 0)
    {
        return;
    }
    num --;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag inSection:sender.section];

    [self setNum:num index:indexPath];
    [self deleteShoppingCart:indexPath];

}
- (void)deleteShoppingCart:(NSIndexPath *)indexPath{
    
    id data =self.leftArr[indexPath.section];
    
    NSArray * arr = [data valueForKey:@"data"];
    
    id data1 = arr[indexPath.row];
    
    if (self.orderArr.count !=0)
    {
        BOOL flage = YES;
        for (NSDictionary *dic in self.orderArr)
        {
            if (dic[@"item_id"]==data1[@"item_id"])
            {
                if ([[dic valueForKey:@"orderCont"]intValue]==0)
                {
                     flage = NO;
                }
               
                break;
            }
        }
        if (!flage)
        {
            
            [self.orderArr removeObject:data1];
        }
    }
    else{
        
        [self.orderArr removeObject:data1];
        
    }

}
// 添加动画以及数量
- (void)setNum:(int)num index:(NSIndexPath *)index{
    
    PopTableViewCell *cell = [self popCell:index];
    
    cell.number.text = [NSString stringWithFormat:@"%d",num];

    id data = self.leftArr[index.section];
    
    NSMutableArray *mutableArr= [data valueForKey:@"data"];
    
    NSMutableDictionary *dic = mutableArr[index.row];
    
    [dic setObject:@(num) forKey:@"orderCont"];
    
    CGRect parentRectA = [cell convertRect:cell.addBtn.frame toView:_dry.view];

    [self startAnimationWithRect:parentRectA ImageView:self.redView];


}
- (PopTableViewCell *)popCell:(NSIndexPath *)index{

    return [self.rightTableView cellForRowAtIndexPath:index];
}
-(void)startAnimationWithRect:(CGRect)rect ImageView:(UIImageView *)imageView
{
    if (!_layer) {
        //        _btn.enabled = NO;
        _layer = [CALayer layer];
        _layer.contents = (id)imageView.layer.contents;
        
        _layer.contentsGravity = kCAGravityResizeAspectFill;
        _layer.bounds = rect;
//        [_layer setCornerRadius:CGRectGetHeight([_layer bounds]) / 2];
        _layer.masksToBounds = YES;
        // 导航64
        _layer.position = CGPointMake(rect.origin.x, CGRectGetMidY(rect));
        //        [_tableView.layer addSublayer:_layer];
        [self.layer addSublayer:_layer];
        
        UIBezierPath * path = [UIBezierPath bezierPath];
        [path moveToPoint:_layer.position];
        //        (SCREEN_WIDTH - 60), 0, -50, 50)
        [path addQuadCurveToPoint:CGPointMake(38, Screen_heigth - 40) controlPoint:CGPointMake(Screen_wide/4,rect.origin.y-80)];
        //        [_path addLineToPoint:CGPointMake(SCREEN_WIDTH-40, 30)];
        [self groupAnimation:(path)];
    }
}
-(void)groupAnimation:(UIBezierPath*)path{
    _rightTableView.userInteractionEnabled = NO;
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    CABasicAnimation *expandAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    expandAnimation.duration = 0.1f;
    expandAnimation.fromValue = [NSNumber numberWithFloat:1];
    expandAnimation.toValue = [NSNumber numberWithFloat:1.3f];
    expandAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *narrowAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    narrowAnimation.beginTime = 0.1;
    narrowAnimation.fromValue = [NSNumber numberWithFloat:1.3f];
    narrowAnimation.duration = 0.4f;
    narrowAnimation.toValue = [NSNumber numberWithFloat:0.3f];
    
    narrowAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,expandAnimation,narrowAnimation];
    groups.duration = 0.5f;
    groups.removedOnCompletion=NO;
    groups.fillMode=kCAFillModeForwards;
    groups.delegate = self;
    [_layer addAnimation:groups forKey:@"group"];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

    if (anim == [_layer animationForKey:@"group"]) {
        _rightTableView.userInteractionEnabled = YES;
        //        _btn.enabled = YES;
        [_layer removeFromSuperlayer];
        _layer = nil;
        _cnt++;
        DryCleanersInfoVC * vc =(DryCleanersInfoVC *) _dry;
        if (_cnt) {
            vc.settemntView.number.hidden = NO;
        }
        CATransition *animation = [CATransition animation];
        animation.duration = 0.25f;
        
        //设置商品数量
        vc.settemntView.number.text = [NSString stringWithFormat:@"%ld",(long)[ShoppingCartModel orderShoppingCartr:self.orderArr]];
        [vc.settemntView setNumber:vc.settemntView.number];
        [vc.settemntView.number.layer addAnimation:animation forKey:nil];
        //设置商品价格
        vc.settemntView.money.text = [NSString stringWithFormat:@"￥%.2f",[ShoppingCartModel moneyOrderShoopingCart:self.orderArr]];
        
        CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
        shakeAnimation.duration = 0.25f;
        shakeAnimation.fromValue = [NSNumber numberWithFloat:-5];
        shakeAnimation.toValue = [NSNumber numberWithFloat:5];
        shakeAnimation.autoreverses = YES;
        [vc.settemntView.shoppingCart.layer addAnimation:shakeAnimation forKey:nil];
    }
}
- (void)setDry:(UIViewController *)dry{
    
    _dry = dry;
    
}
- (void)removeSubView{
    
    
    [self removeFromSuperview];
    
}
@end
