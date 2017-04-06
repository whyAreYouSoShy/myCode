//
//  UIFont+MyFont.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/13.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "UIFont+MyFont.h"

#import <objc/runtime.h>
@implementation UIFont (MyFont)



+ (UIFont *)fontWithMySize:(CGFloat)size {
    return [UIFont fontWithMySize:(size +10)];
}


+ (void)load {
    Method m1 = class_getClassMethod([UIFont class], @selector(fontWithMySize:));
    Method m2 = class_getClassMethod([UIFont class], @selector(systemFontOfSize:));
    method_exchangeImplementations(m1, m2);
}





@end
