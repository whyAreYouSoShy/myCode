//
//  Ball.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "Ball.h"

@implementation Ball


- (Ball *(^)())up {
    return ^{
        NSLog(@"up");
        return self;
    };
}

- (Ball *(^)())right {
    return ^{
        NSLog(@"right");
        return self;
    };
}

- (Ball *(^)())left {
    return ^{
        NSLog(@"left");
        return self;
    };
}

- (Ball *(^)())down {
    return ^{
        NSLog(@"down");
        return self;
    };
}

- (Ball *(^)(NSString *))doSomething {
    return ^(NSString *str){
        NSLog(@"%@",str);
        return self;
    };
}



@end
