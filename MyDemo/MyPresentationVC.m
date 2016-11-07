//
//  MyPresentationVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MyPresentationVC.h"

@implementation MyPresentationVC

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController {
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    return self;
}

#pragma mark-----  弹出
- (void)presentationTransitionWillBegin {
    self.presentedView.frame = self.containerView.bounds;
    
    
    [self.containerView addSubview:self.presentedView];
    
    self.containerView.backgroundColor = [UIColor greenColor];
    
//    self.presentedView.backgroundColor = [UIColor clearColor];
    self.presentedView.backgroundColor = [UIColor greenColor];
}

#pragma mark-----  退出
- (void)dismissalTransitionDidEnd:(BOOL)completed {
    [self.presentedView removeFromSuperview];
}







@end
