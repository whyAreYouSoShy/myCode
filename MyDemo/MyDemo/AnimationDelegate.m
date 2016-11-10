//
//  AnimationDelegate.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "AnimationDelegate.h"
#import "MyPresentationVC.h"


@implementation AnimationDelegate
{
    BOOL isPresent;
}
- (instancetype)init {
    self = [super init];
    _duration = 0.5;
    _bubbleColor = [UIColor redColor];
    _bubble = [UIView new];
    _bubble.backgroundColor = _bubbleColor;
    return self;
}

- (void)setBubbleColor:(UIColor *)bubbleColor {
    _bubbleColor = bubbleColor;
    _bubble.backgroundColor = _bubbleColor;
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    MyPresentationVC *presentationController = [[MyPresentationVC alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    return presentationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    isPresent = NO;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    isPresent = YES;
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    if (isPresent) {
        UIView *presentedControllerView = [transitionContext viewForKey:UITransitionContextToViewKey];
        CGPoint originalCenter = presentedControllerView.center;
        CGSize originalSize = presentedControllerView.frame.size;
        
        self.bubble.frame = [self frameForBubble:originalCenter originalSize:originalSize start:self.starPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = self.starPoint;
        self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.bubble.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.bubble];
        
        presentedControllerView.center = self.starPoint;
        presentedControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        presentedControllerView.alpha = 0;
        [containerView addSubview:presentedControllerView];
        
        [UIView animateWithDuration:self.duration animations:^{
            self.bubble.transform = CGAffineTransformIdentity;
            presentedControllerView.transform = CGAffineTransformIdentity;
            presentedControllerView.alpha = 1;
            presentedControllerView.center = originalCenter;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [self.delegate bubblePresentAnimationCompleted];
        }];
        
    } else {
        UIView *returningControllerView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        CGPoint originalCenter = returningControllerView.center;
        CGSize originalSize = returningControllerView.frame.size;
        
        self.bubble.frame = [self frameForBubble:originalCenter originalSize:originalSize start:self.starPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = self.starPoint;
        
        [self.delegate bubbleDismissAnimationStart];
        [UIView animateWithDuration:self.duration animations:^{
            self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.transform = CGAffineTransformMakeScale(0.001, 0.001);
            returningControllerView.center = self.starPoint;
            returningControllerView.alpha = 0;
        } completion:^(BOOL finished) {
            returningControllerView.center = originalCenter;
            [returningControllerView removeFromSuperview];
            [self.bubble removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }
}


- (CGRect)frameForBubble:(CGPoint)originalCenter originalSize:(CGSize)originalSize start:(CGPoint)start
{
    CGFloat lengthX = fmax(start.x, originalSize.width - start.x);
    CGFloat lengthY = fmax(start.y, originalSize.height - start.y);
    CGFloat offset = sqrt(lengthX * lengthX + lengthY * lengthY) * 2;
    CGSize size = CGSizeMake(offset, offset);
    
    return CGRectMake(CGPointZero.x, CGPointZero.y, size.width, size.height);
}















@end
