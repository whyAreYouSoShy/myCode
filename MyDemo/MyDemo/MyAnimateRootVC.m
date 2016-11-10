//
//  MyAnimateRootVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MyAnimateRootVC.h"
#import "AnimationDelegate.h"

@interface MyAnimateRootVC ()<MyAnimationDelegate>

@end

@implementation MyAnimateRootVC
{
    AnimationDelegate *_bubbleDelegate;
}
- (instancetype)init {
    self = [super init];
    _bubbleDelegate = [AnimationDelegate new];
    _bubbleDelegate.delegate = self;
    self.transitioningDelegate = _bubbleDelegate;
    self.modalPresentationStyle = UIModalPresentationCustom;
    return self;
}

- (void)setBubbleColor:(UIColor *)bubbleColor {
    _bubbleDelegate.bubbleColor = bubbleColor;
}

- (void)setStartPoint:(CGPoint)startPoint {
    _bubbleDelegate.starPoint = startPoint;
}

- (void)setBubbleDuration:(CGFloat)bubbleDuration {
    _bubbleDelegate.duration = bubbleDuration;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 0.0;
    }];
}

- (void)bubblePresentAnimationCompleted {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 1.0;
    }];
}

- (void)bubbleDismissAnimationStart {
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.alpha = 0.0;
    }];
}




@end
