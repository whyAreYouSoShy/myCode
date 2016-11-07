//
//  TitlePageView.m
//  ScrollPageView
//
//  Created by 叶贵忠 on 2016/10/11.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "TitlePageView.h"
//#import "UIColor+Hex.h"
#define selfH self.bounds.size.height
#define selfW self.bounds.size.width

@interface TitlePageView ()<UIScrollViewDelegate>


@property(nonatomic,strong) UIScrollView *contentScrollView;
@property(nonatomic,strong) NSMutableArray *singleTitleWidthArray;
@property(nonatomic,strong) TitleViewStyle *style;
@property(nonatomic,strong) UIViewController *mainController;
@property(nonatomic,strong) UIView *underLine;
//@property(nonatomic,strong) NSArray *normalColorRgb;
//@property(nonatomic,strong) NSArray *selectedColorRgb;
//@property(nonatomic,strong) NSArray *deltaRGB;


@end

@implementation TitlePageView
{
    NSInteger lastTag,lastIndex,maxIndex;
    CGFloat oldPointX;
    CGFloat normalWidth;
    CGFloat dValue;
}

- (instancetype)initWithFrame:(CGRect)frame contentArray:(NSMutableArray *)contentArray titleArray:(NSMutableArray *)titleArray titleViewStyle:(TitleViewStyle *)titleViewStyle mainController:(UIViewController *)mainController{
    
    if (self = [super initWithFrame:frame]) {
        [self initBasicStyleWithContentArray:contentArray titleArray:titleArray titleViewStyle:titleViewStyle];//初始化默认样式
        self.mainController = mainController;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollToIndex:) name:@"titlePageViewNotification" object:nil];
        [self initView];
    }
    return self;
}
#pragma mark-----  默认样式()
- (void)initBasicStyleWithContentArray:(NSMutableArray *)contentArray titleArray:(NSMutableArray *)titleArray titleViewStyle:(TitleViewStyle *)style{
    self.style = style;
    self.underLine = [[UIView alloc]init];
    if (self.style.isTitleAnimate == NO) {
        self.style.selectedFontSize = self.style.fontSize;
    }
    
    dValue = self.style.selectedFontSize - self.style.fontSize;
    lastIndex = self.style.selectedIndex;
    _contentArray = contentArray;
    _titleArray = titleArray;
}

#pragma mark-----  初始化视图
- (void)initView {
    [self initScrollView];
    [self initContentView];
    [self layoutMySubviews];
}

#pragma mark-----  初始化scrollView
- (void)initScrollView {
    self.titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.style.titleViewSize.width, self.style.titleViewSize.height)];
    self.titleScrollView.backgroundColor = [UIColor whiteColor];
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.bounces = NO;
    self.titleScrollView.delegate = self;
    [self addSubview:self.titleScrollView];
    
    self.contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleScrollView.frame), selfW, selfH - self.style.titleViewSize.height)];
    self.contentScrollView.delegate = self;
    self.contentScrollView.backgroundColor = [UIColor whiteColor];
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.contentScrollView];
}

- (void)didMoveToSuperview {
    self.titleScrollView.contentOffset = CGPointMake(0, 0);
}

#pragma mark-----  初始化内容视图
- (void)initContentView {
    self.contentScrollView.contentSize = CGSizeMake(self.contentArray.count * selfW, selfH - self.titleScrollView.frame.size.height);
    if ([self.contentArray[0] isKindOfClass:[UIView class]]) {//如果内容视图是View
        for (UIView *view in self.contentArray) {
            [self.contentScrollView addSubview:view];
        }
    }else{//内容视图是Controller
        for (int i = 0; i < self.contentArray.count; i ++) {
            if (i == self.style.selectedIndex) {
                UIViewController *vc = self.contentArray[i];
                [self.mainController addChildViewController:vc];
                vc.view.frame = CGRectMake(selfW * i, 0, selfW, selfH - self.titleScrollView.bounds.size.height);
                [self.contentScrollView addSubview:vc.view];
                [self.contentScrollView setContentOffset:CGPointMake(selfW*i, 0)];
            }
        }
    }
}

#pragma mark-----  设置重新赋值过后的frame
- (void)layoutMySubviews {
    if (self.titleScrollView.subviews.count) {
        for (UIView *views in self.titleScrollView.subviews) {
            [views removeFromSuperview];
        }
    }
    [self calculateSingleTitleWidth];//计算每个标题所占的宽度
    [self initTitleSubViews];//创建标题控件
    [self adjustTitlePositionWithCurrentIndex:self.style.selectedIndex];
}

- (void)calculateSingleTitleWidth {
    CGFloat titleScrollViewContentWidth = 0.f;
    NSMutableArray *tempArray = [NSMutableArray array];
    if (self.style.isEqualWidth == YES) {//不等宽的样式
        if (self.style.divideNum){//有设置几等分
            CGFloat singleWidth = selfW/self.style.divideNum;
            titleScrollViewContentWidth = singleWidth * self.titleArray.count;
            for (int i = 0; i < self.titleArray.count; i ++) {
                [tempArray addObject:@(singleWidth)];
            }
        }else{//等宽样式
            CGFloat singleWidth = selfW/self.titleArray.count;
            titleScrollViewContentWidth = selfW;
            for (int i = 0; i < self.titleArray.count; i ++) {
                [tempArray addObject:@(singleWidth)];
            }
        }
    }else{
        for (NSString *titleString in self.titleArray) {
            CGFloat singleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.style.fontSize]}].width + 2*self.style.spacing + dValue*titleString.length;
            titleScrollViewContentWidth += singleWidth;
            [tempArray addObject:@(singleWidth)];
        }
    }
    self.singleTitleWidthArray = tempArray;
    self.titleScrollView.contentSize = CGSizeMake(titleScrollViewContentWidth, self.style.titleViewSize.height);
}

#pragma mark-----  创建button
- (void)initTitleSubViews {
    CGFloat lastPositionX = 0.f;
    for (int i = 0; i < self.titleArray.count; i ++)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(lastPositionX, 0, [self.singleTitleWidthArray[i] floatValue] , self.style.titleViewSize.height)];
        button.titleLabel.font = [UIFont systemFontOfSize:self.style.fontSize];
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:self.style.titleNormalColor forState:UIControlStateNormal];
        [button setTitleColor:self.style.titleSelectedColor forState:UIControlStateSelected];
        button.tag = 500 + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        lastPositionX += [self.singleTitleWidthArray[i] floatValue];
        [self.titleScrollView addSubview:button];
        
        if (i == self.style.selectedIndex)
        {//设置默认选中的样式
            button.selected = YES;
            lastTag = 500 + self.style.selectedIndex;
            button.titleLabel.font = [UIFont systemFontOfSize:self.style.selectedFontSize];
            self.contentScrollView.contentOffset = CGPointMake(self.style.selectedIndex*selfW, 0);
            if (self.style.isUnderLineAppear == YES)
            {
                self.underLine.backgroundColor = self.style.underLineColor;
                [self.titleScrollView addSubview:self.underLine];
                if (self.style.widthIsFollowTitleWidth){//线和文字等宽
                    NSString *titleString = self.titleArray[i];
                    CGFloat singleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.style.fontSize]}].width + dValue*titleString.length;
                    self.underLine.frame = CGRectMake(button.frame.origin.x + ([self.singleTitleWidthArray[i] floatValue] - singleWidth)*0.5, self.style.titleViewSize.height - self.style.lineHeight, singleWidth, self.style.lineHeight);
                }else{//线和button等宽
                    self.underLine.frame = CGRectMake(button.frame.origin.x, self.style.titleViewSize.height - self.style.lineHeight, [self.singleTitleWidthArray[i] floatValue], self.style.lineHeight);
                }
            }
        }
        
        if (self.style.isUnderLineAppear == YES) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.style.titleViewSize.height - 0.5, self.titleScrollView.contentSize.width, 0.5)];
            line.backgroundColor = self.style.separateLineColor;
            [self.titleScrollView addSubview:line];
        }
        
        if (self.style.isSeparateLine == YES) {
            [self initSeparateLineWith:button];
        }
    }
}

#pragma mark-----  创建分割线
- (void)initSeparateLineWith:(UIButton *)sender {
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(sender.frame.size.width, (sender.frame.size.height - self.style.separateLineHeight)/2, 0.5, self.style.separateLineHeight)];
    line.backgroundColor = self.style.separateLineColor;
    [sender addSubview:line];
}


#pragma mark-----  标题的点击事件
- (void)buttonClick:(UIButton *)sender {
    if (sender.tag == lastTag) {//点击当前标题不响应
        return;
    }
    sender.selected = !sender.selected;
    sender.titleLabel.font = [UIFont systemFontOfSize:self.style.selectedFontSize];
    UIButton *lastB = (UIButton *)[self.titleScrollView viewWithTag:lastTag];
    lastB.selected = !sender.selected;
    lastB.titleLabel.font = [UIFont systemFontOfSize:self.style.fontSize];
    lastTag = sender.tag;
    self.contentScrollView.contentOffset = CGPointMake((sender.tag - 500)*selfW, 0);
    [self adjustTitlePositionWithCurrentIndex:(int)(sender.tag-500)];
    if (self.contentScrollView) {
        [self adjustUnderLinePositionWithScrollView:self.contentScrollView];
    }else{
        [self adjustUnderLinePositionWithIndex:(lastTag - 500)];
    }
}

#pragma mark-----  调整标题的位置 (此方法将代理发出去)
- (void)adjustTitlePositionWithCurrentIndex:(int)currentIndex {
    if (self.style.selectedIndex == 0) {//高效率
        if (maxIndex < currentIndex) {
            UIViewController *vc = self.contentArray[currentIndex];
            [self.mainController addChildViewController:vc];
            vc.view.frame = CGRectMake(selfW * currentIndex, 0, selfW, selfH - self.titleScrollView.frame.size.height);
            [self.contentScrollView addSubview:vc.view];
        }
    }else{//效率偏低
        UIViewController *vc = self.contentArray[currentIndex];
        BOOL isEqual = YES;
        for (UIView *views in self.contentScrollView.subviews) {
            if (vc.view == views) {
                isEqual = NO;
            }
        }
        if (isEqual == YES) {
            [self.mainController addChildViewController:vc];
            vc.view.frame = CGRectMake(selfW * currentIndex, 0, selfW, selfH - self.titleScrollView.frame.size.height);
            [self.contentScrollView addSubview:vc.view];
        }
    }
    
    if (currentIndex != lastIndex) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pageViewSelectedIndex:)]) {//代理方法
            [self.delegate pageViewSelectedIndex:currentIndex];
        }
        lastIndex = currentIndex;
    }
    if (self.titleArray.count < 6) {//5个以及5个以下标题,不需要调整位置
        return;
    }
    UIButton *currentB = [self.titleScrollView viewWithTag:(currentIndex +500)];
    CGFloat offSetX = currentB.center.x - selfW*0.5;
    if (offSetX <= 0) {
        offSetX = 0;
    }
    if (currentB.center.x > self.titleScrollView.contentSize.width - selfW*0.5) {
        [self.titleScrollView setContentOffset:CGPointMake(self.titleScrollView.contentSize.width-selfW, 0) animated:YES];
        return;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offSetX, 0) animated:YES];
}

#pragma mark-----  调整线条的位置
- (void)adjustUnderLinePositionWithIndex:(NSInteger)index {
    UIButton *tempB = [self.titleScrollView viewWithTag:(index + 500)];
    oldPointX = index * selfW;
    NSString *titleString = self.titleArray[index];
    CGFloat singleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.style.fontSize]}].width + dValue*titleString.length;
    if (self.style.widthIsFollowTitleWidth == YES) {
        self.underLine.frame = CGRectMake(tempB.frame.origin.x + ([self.singleTitleWidthArray[index] floatValue] - singleWidth)*0.5 , self.style.titleViewSize.height - self.style.lineHeight, singleWidth, self.style.lineHeight);
    }else{
        self.underLine.frame = CGRectMake(tempB.frame.origin.x, self.style.titleViewSize.height - self.style.lineHeight, tempB.frame.size.width, self.style.lineHeight);
    }
}
- (void)adjustUnderLinePositionWithScrollView:(UIScrollView *)scrollView{
    int i = self.contentScrollView.contentOffset.x/selfW;
    oldPointX = i * selfW;
    CGFloat distance = scrollView.contentOffset.x - oldPointX;
    UIButton *tempB = [self.titleScrollView viewWithTag:(i + 500)];
    NSString *titleString = self.titleArray[i];
    CGFloat singleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.style.fontSize]}].width + dValue*titleString.length;
    if (self.style.widthIsFollowTitleWidth == YES) {
        self.underLine.frame = CGRectMake(tempB.frame.origin.x + ([self.singleTitleWidthArray[i] floatValue] - singleWidth)*0.5 + (distance * [self.singleTitleWidthArray[0] floatValue] / selfW), self.style.titleViewSize.height - self.style.lineHeight, singleWidth, self.style.lineHeight);
    }else{
        self.underLine.frame = CGRectMake(tempB.frame.origin.x + (distance * [self.singleTitleWidthArray[0] floatValue] / selfW), self.style.titleViewSize.height - self.style.lineHeight, tempB.frame.size.width, self.style.lineHeight);
    }
    
    //调整标题颜色
//    CGFloat progress = distance/selfW;
//    lastB.titleLabel.font = [UIFont systemFontOfSize:(self.style.selectedFontSize - dValue*progress)];
//    tempB.titleLabel.font = [UIFont systemFontOfSize:self.style.fontSize + dValue*progress];
//    NSLog(@"%f  %f  %f",progress,floor(distance),selfW);
//    UIColor *oldColor = [UIColor colorWithRed:[self.selectedColorRgb[0] floatValue] + [self.deltaRGB[0] floatValue] * progress green:[self.selectedColorRgb[1] floatValue] + [self.deltaRGB[1] floatValue] * progress blue:[self.selectedColorRgb[2] floatValue] + [self.deltaRGB[2] floatValue] * progress alpha:1.0];
//    
//    UIColor *newColor = [UIColor colorWithRed:[self.normalColorRgb[0] floatValue] - [self.deltaRGB[0] floatValue] * progress green:[self.normalColorRgb[1] floatValue] - [self.deltaRGB[1] floatValue] * progress blue:[self.normalColorRgb[2] floatValue] - [self.deltaRGB[2] floatValue] * progress alpha:1.0];
    
//    [tempB setTitleColor:newColor forState:0];
//    [lastB setTitleColor:oldColor forState:0];
}


// --------------------------------------------- scrollView的代理方法 --------------------------------------------- //
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        [self adjustUnderLinePositionWithScrollView:scrollView];
    }
    NSLog(@"%f",self.titleScrollView.contentOffset.y);
    NSLog(@"%@",NSStringFromCGSize(self.titleScrollView.contentSize));
    NSLog(@"%@",NSStringFromCGRect(self.titleScrollView.frame));
}

#pragma mark-----  减速完成的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.contentScrollView) {
        int currentIndex = self.contentScrollView.contentOffset.x/selfW;
        [self buttonClick:([self.titleScrollView viewWithTag:(currentIndex+500)])];
        [self adjustTitlePositionWithCurrentIndex:currentIndex];
    }
}



// ****************************************  单个controlelr  **************************************** //

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSMutableArray *)titleArray titleViewStyle:(TitleViewStyle *)titleViewStyle{
    if (self = [super initWithFrame:frame]) {
        [self initTitleViewWithStyle:titleViewStyle titleArray:titleArray];
    }
    return self;
}

- (void)initTitleViewWithStyle:(TitleViewStyle *)style titleArray:(NSMutableArray *)titleArray {
    self.style = style;
    self.underLine = [[UIView alloc]init];
    if (self.style.isTitleAnimate == NO) {
        self.style.selectedFontSize = self.style.fontSize;
    }
    dValue = self.style.selectedFontSize - self.style.fontSize;
    lastIndex = self.style.selectedIndex;
    _titleArray = titleArray;
    self.titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.style.titleViewSize.width, self.style.titleViewSize.height)];
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.delegate = self;
    [self addSubview:self.titleScrollView];
    [self layoutMySubviews];
}

- (void)scrollToIndex:(NSNotification *)noti {
    NSInteger index = [noti.object integerValue] + 500;
    [self buttonClick:[self viewWithTag:index]];
}





@end
