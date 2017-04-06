//
//  DemoCell.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/12/18.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "DemoCell.h"

@implementation DemoCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    [self.contentView addSubview:btn];
    
    
    [self.contentView addSubview:self.verticalLine];
    
        
    [self.contentView addSubview:self.line];
 
    
    self.contentView.clipsToBounds = NO;
}



- (UIView *)verticalLine {
    
    if (!_verticalLine) {
        
        _verticalLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
        
        _verticalLine.backgroundColor = [UIColor colorWithHexString:@"cccccc"];
    }
    return _verticalLine;
}



- (UIView *)line {
    
    if (!_line) {
        
        _line = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width - 0.5, 0, 0.5, self.frame.size.height)];
        
        _line.backgroundColor = [UIColor colorWithHexString:@"cccccc"];
    }
    return _line;
}

@end
