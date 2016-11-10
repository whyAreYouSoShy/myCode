//
//  DrawerCenterVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/10/27.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "DrawerCenterVC.h"

@interface DrawerCenterVC ()

@end

@implementation DrawerCenterVC
{
    UIView *drawerView;
    CGFloat firstX;//self.view 当前的x值
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    [self initDrawerView];
    
}

- (void)initDrawerView {
    drawerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, XSWidth * 0.3, XSHeight)];
    drawerView.backgroundColor = [UIColor orangeColor];
    drawerView.userInteractionEnabled = YES;
    [self.view addSubview:drawerView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panMove:)];
    [drawerView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [drawerView addGestureRecognizer:tap];
    
    firstX = self.view.x;
    //两个事件不会有冲突
}


- (void)panMove:(UIPanGestureRecognizer *)pan {
    CGFloat d = [pan translationInView:self.view].x;
    self.view.x = firstX + d;
    if (self.view.x >= XSWidth*0.7) {//达到边界值 停止滑动
        firstX = self.view.x;
        return;
    }
    if (pan.state == UIGestureRecognizerStateEnded) { //结束移动
        if (self.view.x > XSWidth/2) {
            [UIView animateWithDuration:0.25 animations:^{//动画弹回
                self.view.x = XSWidth *0.7;
            }];
        }else{
            [UIView animateWithDuration:0.25 animations:^{
                self.view.x = 0;
            }];
        }
        firstX = self.view.x;
    }
    NSLog(@"x=%.f          y=%.f",self.view.x,[pan translationInView:self.view].x);
}

- (void)tapClick {
    NSLog(@"tapClicl");
}








@end
