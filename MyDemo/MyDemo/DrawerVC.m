//
//  DrawerVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/10/27.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "DrawerVC.h"
#import "DrawerLeftVC.h"
#import "DrawerCenterVC.h"



@interface DrawerVC ()

@end

@implementation DrawerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"抽屉模型";
    
    [self initSubVCs];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}


#pragma mark-----  初始化子Controller
- (void)initSubVCs {
    DrawerLeftVC *leftVc = [[DrawerLeftVC alloc]init];
    DrawerCenterVC *centerVc = [[DrawerCenterVC alloc]init];
    
    [self addChildViewController:leftVc];
    [self addChildViewController:centerVc];
    
    leftVc.view.frame = CGRectMake(0, 64, XSWidth * 0.7, XSHeight-64);
    centerVc.view.frame = CGRectMake(0, 64, XSWidth, XSHeight-64);
    
    [self.view addSubview:leftVc.view];
    [self.view addSubview:centerVc.view];
}























@end
