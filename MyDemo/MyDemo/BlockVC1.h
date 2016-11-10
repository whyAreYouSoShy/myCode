//
//  BlockVC1.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "RootViewController.h"

typedef void (^ReturnTextBlock)(NSString *testString);

@interface BlockVC1 : RootViewController

@property(nonatomic,copy) ReturnTextBlock returnTextblock;

- (void)returnText:(ReturnTextBlock)block;

















@end
