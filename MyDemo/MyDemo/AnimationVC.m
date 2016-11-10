//
//  AnimationVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/10.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()<CAAnimationDelegate>

@end

@implementation AnimationVC
{
    CALayer *layer;
    CAShapeLayer *arcLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    layer = [CALayer layer];
//    layer.bounds = CGRectMake(0, 0, 200, 200);
//    layer.position = CGPointMake(160, 200);
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:layer];
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [CATransaction setDisableActions:NO];
//    layer.cornerRadius = 100.f;
//    layer.opacity = 0.5f;
    
    //显式事务(通过明确的调用begin,commit来提交动画)
//    [CATransaction begin];
//    [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
//    [CATransaction setValue:@5 forKey:kCATransactionAnimationDuration];
//    layer.cornerRadius = 100.f;
//    layer.opacity = 0.3f;
//    layer.zPosition = 60.f;
//    [CATransaction commit];
    
//    UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 5, 5)];
//    smallView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:smallView];
//    
//    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddArc(path, NULL, 100, 320, 50, 0, 2*M_PI, 1);
//    keyAnimation.path = path;
//    keyAnimation.duration = 5.f;
//    keyAnimation.repeatCount = 50;
//    [smallView.layer addAnimation:keyAnimation forKey:nil];
    
    [self intiUIOfView];
}


-(void)intiUIOfView
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    CGRect rect=[UIScreen mainScreen].bounds;
    [path addArcWithCenter:CGPointMake(rect.size.width/2,rect.size.height/2-20) radius:100 startAngle:0 endAngle:2*M_PI clockwise:1];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor=[UIColor whiteColor].CGColor;
    arcLayer.strokeColor=[UIColor redColor].CGColor;
    arcLayer.lineWidth=5;
    arcLayer.frame=self.view.frame;
    [self.view.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer];
}
//定义动画过程
-(void)drawLineAnimation:(CALayer*)layer1
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=3;
//    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer1 addAnimation:bas forKey:@""];
}
































@end
