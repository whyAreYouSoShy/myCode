//
//  MyBlockVC.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyBlockVCDelegate <NSObject>

- (UIView *)todosomething;

@end


@interface MyBlockVC : UIViewController


@property(nonatomic,assign) id<MyBlockVCDelegate> delegate;

@end
