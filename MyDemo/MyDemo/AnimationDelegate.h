//
//  AnimationDelegate.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol MyAnimationDelegate <NSObject>

@required
- (void)bubblePresentAnimationCompleted;
- (void)bubbleDismissAnimationStart;

@end

@interface AnimationDelegate : NSObject<UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>




@property(nonatomic,assign) id<MyAnimationDelegate> delegate;

@property(nonatomic,assign) CGPoint starPoint;
@property(nonatomic,assign) CGFloat duration;

@property(nonatomic,strong) UIColor *bubbleColor;
@property(nonatomic,strong) UIView *bubble;


@end
