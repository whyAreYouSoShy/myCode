//
//  TitleViewStyle.m
//  ScrollPageView
//
//  Created by 叶贵忠 on 2016/10/11.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "TitleViewStyle.h"
#import "UIColor+Hex.h"
@implementation TitleViewStyle

- (instancetype)init {
    if (self = [super init]) {
        self.titleViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 40);
        self.titleSelectedColor = [UIColor colorWithHexString:@"dd2828"];
        self.titleNormalColor = [UIColor colorWithHexString:@"333333"];
        self.underLineColor = [UIColor redColor];
        self.lineHeight = 2.f;
        self.spacing = 4.f;
        self.fontSize = 14.f;
        self.selectedFontSize = (self.fontSize+2);
        self.isUnderLineAppear = YES;
        self.isEqualWidth = YES;
        self.isTitleAnimate = YES;
        self.widthIsFollowTitleWidth = NO;
        self.divideNum = 4;
        self.isSeparateLine = NO;
        self.selectedIndex = 0;
        self.separateLineHeight = 14;
        self.separateLineColor = [UIColor redColor];
        self.separateLineColor = [UIColor colorWithHexString:@"eeeeee"];
    }
    return self;
}






@end
