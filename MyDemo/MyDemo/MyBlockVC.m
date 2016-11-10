//
//  MyBlockVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MyBlockVC.h"

#import "Ball.h"

#import "BlockVC1.h"

@interface MyBlockVC ()

@end

@implementation MyBlockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"block";
    
    Ball *ball = [[Ball alloc]init];
    ball.up().right();
    ball.doSomething(@"yeguizhong");
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    BlockVC1 *vc = [[BlockVC1 alloc]init];
    [vc returnText:^(NSString *testString) {
        self.title = testString;
    }];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
