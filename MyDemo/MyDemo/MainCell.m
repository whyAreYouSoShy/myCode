//
//  MainCell.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/10/27.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell



- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.cellTitle = [[UILabel alloc]initWithFrame:self.contentView.frame];
    self.cellTitle.textAlignment = 1;
    self.cellTitle.textColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.cellTitle.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:self.cellTitle];
}




@end
