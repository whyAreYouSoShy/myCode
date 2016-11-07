//
//  ViewAppearAnimateVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "ViewAppearAnimateVC.h"
#import "ViewAppearVC1.h"
@interface ViewAppearAnimateVC ()

@end

@implementation ViewAppearAnimateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"第一页";
    
    
//    self.modalPresentationStyle = UIModalPresentationCustom;
//    self.navigationController.modalPresentationStyle = UIModalPresentationPageSheet;
//    self.transitioningDelegate = self;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    ViewAppearVC1 *vc = [[ViewAppearVC1 alloc]init];
    vc.startPoint = point;
    vc.bubbleColor = [UIColor whiteColor];
    vc.bubbleDuration = 0.6;
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    [self.navigationController presentViewController:nav animated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
}



- (void)dealloc {
    NSLog(@"viewapperaranimatevc");
}

@end
