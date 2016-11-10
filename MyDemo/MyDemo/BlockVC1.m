//
//  BlockVC1.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "BlockVC1.h"

@interface BlockVC1 ()

@end

@implementation BlockVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (BlockVC1 *(^)(NSString *))doSomething {
    return ^(NSString *str){
        return self;
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.returnTextblock) {
        self.returnTextblock(@"yeguizhong");
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)returnText:(ReturnTextBlock)block {
    self.returnTextblock = block;
}


@end
