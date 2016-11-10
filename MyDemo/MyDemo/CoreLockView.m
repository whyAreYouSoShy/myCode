//
//  CoreLockView.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/10.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "CoreLockView.h"

@implementation CoreLockView


//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    self.backgroundColor = [UIColor whiteColor];
//    return self;
//}

- (void)drawRect:(CGRect)rect {
    
//    [self drawNine:rect];  //画九宫格
    
//    [self drawPolygon:rect];//画多边形
    
    [self drawOval:rect];
}




#pragma mark-----  圆或者椭圆
- (void)drawOval:(CGRect)rect {
    
    [[UIColor orangeColor] set];
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(160, 250) radius:100 startAngle:0 endAngle:2*M_PI clockwise:0]; //圆
    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(150, 250, 100, 150)];//椭圆
    
    [bezierPath stroke];
}

#pragma mark-----  将度数转化为弧度
- (CGFloat)degressToRadiausWithDegrees:(CGFloat)degrees {
    return M_PI * degrees / 180;
}

#pragma mark-----  画多边形
- (void)drawPolygon:(CGRect)rect {
    
    [[UIColor redColor] set];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 2.f;
    
    path.lineCapStyle = kCGLineCapRound;//线条拐角
    
    path.lineJoinStyle = kCGLineCapRound;//终点处理
    
    [path moveToPoint:CGPointMake(100, 20)];//起始位置
    
    [path addLineToPoint:CGPointMake(200, 40)];
    
    [path addLineToPoint:CGPointMake(160, 140)];
    
    [path addLineToPoint:CGPointMake(40, 140)];
    
    [path addLineToPoint:CGPointMake(0, 40)];
    
    [path closePath];//调用这个方法会将最后一个点与最开始的那个店连接
    
    [path stroke]; //描边
    
//    [path fill];//填充
    
}


#pragma mark-----  画九宫格
- (void)drawNine:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.f);//设置宽度
    [[UIColor colorWithHexString:@"ff7d20"] set];//设置颜色
    
    CGMutablePathRef pathM = CGPathCreateMutable();
    
    //九宫格
    CGFloat margin = 50.f;
    CGFloat padding = 5.f;
    CGFloat width = (rect.size.width - margin*2 - padding*2) / 3;
    
    for (int i = 0; i < 9; i ++) {
        NSUInteger row = i % 3;
        NSUInteger col = i / 3;
        
        CGFloat rectX = (width + margin)*row + padding;
        CGFloat rectY = (width + margin)*col + padding;
        
        CGRect myRect = CGRectMake(rectX, rectY, width, width);
        CGPathAddEllipseInRect(pathM, NULL, myRect);
    }
    
    CGContextAddPath(context, pathM); //添加路径
    
    CGContextStrokePath(context);//绘制路径
    
    CGPathRelease(pathM);//释放路径
}




@end
