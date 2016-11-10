//
//  CoreLock.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/10.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "CoreLockVC.h"

#import "CoreLockView.h"


@interface CoreLockVC ()

@property(nonatomic,strong) CoreLockView *lockView;

@end

@implementation CoreLockVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"图案解锁";
    
    NSArray *titleArr = @[@"设置密码",@"验证密码",@"修改密码"];
    for (int i = 0; i < 3; i ++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100+ 100*i, XSWidth, 60)];
        [button setTitle:titleArr[i] forState:0];
        [button setTitleColor:[UIColor blueColor] forState:0];
        button.titleLabel.font = [UIFont systemFontOfSize:25];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 666 + i;
        [self.view addSubview:button];
    }
}


- (void)buttonClick:(UIButton *)sender {
    if (sender.tag - 666 == 0) {//设置密码
        self.lockView = [[CoreLockView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.frame.size.height - 64)];
        [self.view addSubview:self.lockView];
    }else if(sender.tag - 666 == 1) {//验证密码
        
    }else{//修改密码
        
    }
}












@end
