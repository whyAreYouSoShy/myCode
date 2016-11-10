//
//  TitlePageView.h
//  ScrollPageView
//
//  Created by 叶贵忠 on 2016/10/11.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TitleViewStyle.h"

@protocol TitlePageViewDelegate <NSObject>

- (void)pageViewSelectedIndex:(NSInteger)index;

@end


@interface TitlePageView : UIView


/*
 *  装着标题的数组
 */
@property(nonatomic,strong) NSMutableArray *titleArray;

@property(nonatomic,strong) UIScrollView *titleScrollView;

/*
 *  装着controller或者View的数组
 */
@property(nonatomic,strong) NSMutableArray *contentArray;




@property(nonatomic,assign) id<TitlePageViewDelegate> delegate;




//- (instancetype)initWithFrame:(CGRect)frame contentArray:(NSMutableArray *)contentArray mainVC:(UIViewController *)mainVC;

/**
 *  设置多个Controller的初始化方法
 *  contentArray:装着Controller或者View
 *  titleArray:装着标题的数组
 *  titleViewStyle:标题的样式
 */
- (instancetype)initWithFrame:(CGRect)frame contentArray:(NSMutableArray *)contentArray titleArray:(NSMutableArray *)titleArray titleViewStyle:(TitleViewStyle *)titleViewStyle mainController:(UIViewController *)mainController;

/**
 *  单个Controller的初始化方法
 */
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSMutableArray *)titleArray titleViewStyle:(TitleViewStyle *)titleViewStyle;













@end
