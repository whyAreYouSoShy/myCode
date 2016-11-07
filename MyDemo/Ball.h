//
//  Ball.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ball : NSObject


- (Ball *(^)())up;

- (Ball *(^)())down;

- (Ball *(^)())left;

- (Ball *(^)())right;

- (Ball *(^)(NSString *string))doSomething;
@end
