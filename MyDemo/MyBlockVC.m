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
    self.delegate = vc;
    if (self.delegate && [self.delegate respondsToSelector:@selector(todosomething)]) {
        UIView *view = [self.delegate todosomething];
        view.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:view];
    }
    
    
    
    
    
    
    
    [vc returnText:^(NSString *testString) {
        self.title = testString;
    }];
    [vc testWithSuccess:^(id obj) {
        
    }faild:^(id obj) {
        
    }];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
