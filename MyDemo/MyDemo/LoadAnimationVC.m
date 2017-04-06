//
//  LoadAnimationVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2017/4/6.
//  Copyright © 2017年 yeguizhong. All rights reserved.
//

#import "LoadAnimationVC.h"

@interface LoadAnimationVC ()<CAAnimationDelegate>


@property(nonatomic,strong) UIVisualEffectView *ballView;

@end


@implementation LoadAnimationVC
{
    UIView *_ball1,*_ball2,*_ball3;
    CGFloat scale;
    
    CGFloat ballWidth;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    scale = 1.5f;
    
    ballWidth = 20;
    
    [self addBall];
    
    [self startAnimation];
}





- (void)addBall {
    
    _ball1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ballWidth, ballWidth)];
    _ball1.center = CGPointMake(ballWidth/2.0f, self.ballView.bounds.size.height/2.0f);
    _ball1.layer.cornerRadius = ballWidth/2.0f;
    _ball1.backgroundColor = [UIColor colorWithRed:54/255.0 green:136/255.0 blue:250/255.0 alpha:1];
    [self.ballView addSubview:_ball1];
    
    _ball2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ballWidth, ballWidth)];
    _ball2.center = CGPointMake(self.ballView.bounds.size.width/2.0f, self.ballView.bounds.size.height/2.0f);
    _ball2.layer.cornerRadius = ballWidth/2.0f;
    _ball2.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    [self.ballView addSubview:_ball2];
    
    _ball3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ballWidth, ballWidth)];
    _ball3.center = CGPointMake(self.ballView.bounds.size.width - ballWidth/2.0f, self.ballView.bounds.size.height/2.0f);
    _ball3.layer.cornerRadius = ballWidth/2.0f;
    _ball3.backgroundColor = [UIColor colorWithRed:234/255.0 green:67/255.0 blue:69/255.0 alpha:1];
    [self.ballView addSubview:_ball3];
    
}

- (void)startAnimation {
    
    //第一个球的动画
    CGFloat width = self.ballView.bounds.size.width;
    //小圆半径
    CGFloat r = (_ball1.bounds.size.width)*scale/2.0f;
    //大圆半径
    CGFloat R = (width/2 + r)/2.0;
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:_ball1.center];
    //画大圆
    [path1 addArcWithCenter:CGPointMake(R + r, width/2) radius:R startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    //画小圆
    UIBezierPath *path1_1 = [UIBezierPath bezierPath];
    [path1_1 addArcWithCenter:CGPointMake(width/2, width/2) radius:r*2 startAngle:M_PI*2 endAngle:M_PI clockwise:NO];
    [path1 appendPath:path1_1];
    //回到原处
    [path1 addLineToPoint:_ball1.center];
    //执行动画
    CAKeyframeAnimation *animation1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation1.path = path1.CGPath;
    animation1.removedOnCompletion = YES;
    animation1.duration = 2.f;
    animation1.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0.3 :0.3 :1.0];
    [_ball1.layer addAnimation:animation1 forKey:@"animation1"];
    
    //3球的动画
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [path3 moveToPoint:_ball3.center];
    //画大圆
    [path3 addArcWithCenter:CGPointMake(width - (R + r), width/2) radius:R startAngle:2*M_PI endAngle:M_PI clockwise:NO];
    //画小圆
    UIBezierPath *path3_1 = [UIBezierPath bezierPath];
    [path3_1 addArcWithCenter:CGPointMake(width/2, width/2) radius:r*2 startAngle:M_PI endAngle:M_PI*2 clockwise:NO];
    [path3 appendPath:path3_1];
    //回到原处
    [path3 addLineToPoint:_ball3.center];
    //执行动画
    CAKeyframeAnimation *animation3 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation3.path = path3.CGPath;
    animation3.removedOnCompletion = YES;
    animation3.duration = 2.f;
    animation3.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.3 :0.3 :0.3 :1.0];
    animation3.delegate = self;
    [_ball3.layer addAnimation:animation3 forKey:@"animation3"];
    
}



- (void)animationDidStart:(CAAnimation *)anim {
    
    CGFloat delay = 0.2f;
    CGFloat duration = 1.f - delay;
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseOut| UIViewAnimationOptionBeginFromCurrentState animations:^{
        _ball1.transform = CGAffineTransformMakeScale(scale, scale);
        _ball2.transform = CGAffineTransformMakeScale(scale, scale);
        _ball3.transform = CGAffineTransformMakeScale(scale, scale);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut| UIViewAnimationOptionBeginFromCurrentState animations:^{
            _ball1.transform = CGAffineTransformIdentity;
            _ball2.transform = CGAffineTransformIdentity;
            _ball3.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self startAnimation];
        }];
    }];
}
















- (UIView *)ballView {
    if (!_ballView) {
        _ballView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _ballView.frame = CGRectMake(0, 0, 200, 200);
        _ballView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
        _ballView.layer.cornerRadius = 20.f;
        _ballView.layer.masksToBounds = YES;
        [self.view addSubview:_ballView];
    }
    return _ballView;
}





@end
