//
//  test4Cell.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/3.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "test4Cell.h"

@implementation test4Cell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}


- (void)initView {
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
    self.myLabel.layer.cornerRadius = CGRectGetWidth(self.contentView.frame)/2;
    self.myLabel.clipsToBounds = YES;
    self.myLabel.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    [self.contentView addSubview:self.myLabel];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = 3.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.masksToBounds = NO;
}



@end
