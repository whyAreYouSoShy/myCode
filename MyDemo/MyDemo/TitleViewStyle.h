//
//  TitleViewStyle.h
//  ScrollPageView
//
//  Created by 叶贵忠 on 2016/10/11.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TitleViewStyle : NSObject

/**
 *  顶部View的大小
 */
@property(nonatomic,assign) CGSize titleViewSize;

/**
 *  文字未选中颜色
 */
@property(nonatomic,strong) UIColor *titleNormalColor;

/**
 *  文字选中颜色
 */
@property(nonatomic,strong) UIColor *titleSelectedColor;

/**
 *  线条颜色
 */
@property(nonatomic,strong) UIColor *underLineColor;

/**
 *  title字体大小
 */
@property(nonatomic,assign) CGFloat fontSize;

/**
 *  选中的标题字体大小
 */
@property(nonatomic,assign) CGFloat selectedFontSize;

/**
 *  文字与边框的间距
 */
@property(nonatomic,assign) CGFloat spacing;

/**
 *  线条高度
 */
@property(nonatomic,assign) CGFloat lineHeight;

/**
 *  底线的宽度是否等于文字的宽度
 */
@property(nonatomic,assign) BOOL widthIsFollowTitleWidth;

/**
 *  选中文字的时候是否需要动画
 */
@property(nonatomic,assign) BOOL isTitleAnimate;

/**
 *  是否等间距 默认:YES
 */
@property(nonatomic,assign) BOOL isEqualWidth;

/**
 *  几等分 默认:0
 */
@property(nonatomic,assign) CGFloat divideNum;

/**
 *  当前选中标题的下标,初始化时候使用默认:0
 */
@property(nonatomic,assign) int selectedIndex;

/**
 *  设置是否要调整title的位置 标题数小于5默认设置为NO,反之
 */
@property(nonatomic,assign) BOOL isAdjustTitlePosition;

/**
 *  底部线条是否显示:默认是YES
 */
@property(nonatomic,assign) BOOL isUnderLineAppear;

/**
 *  是否有标题分割线 默认:NO
 */
@property(nonatomic,assign) BOOL isSeparateLine;

/**
 *  标题分割线的高度
 */
@property(nonatomic,assign) CGFloat separateLineHeight;

/**
 *  标题分割线的颜色
 */
@property(nonatomic,strong) UIColor *separateLineColor;

/**
 *  底部分割线是否显示
 */
@property(nonatomic,assign) BOOL separateUnderLineAppear;

/**
 *  底部分割线颜色
 */
@property(nonatomic,strong) UIColor *separateUnderLineColor;


@end
