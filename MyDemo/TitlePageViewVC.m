//
//  TitlePageViewVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/2.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "TitlePageViewVC.h"

#import "TitlePageView.h"
#import "TitleViewStyle.h"
#import "TitlePageVC1.h"

@interface TitlePageViewVC ()<TitlePageViewDelegate>

@end

@implementation TitlePageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = @"titlePageView";
    self.view.backgroundColor = [UIColor yellowColor];
    TitleViewStyle *style = [[TitleViewStyle alloc]init];
    style.selectedIndex = 4;
    style.fontSize = 14;
    style.isEqualWidth = YES;
    style.divideNum = 4;
    style.selectedIndex = 3;
    style.widthIsFollowTitleWidth = YES;
    style.titleNormalColor = [UIColor blueColor];
    style.isSeparateLine = YES;
    NSMutableArray *titleArray = @[@"长一点的",@"长一点的",@"长一点的",@"长一点的",@"长一点的",@"长一点的",@"中等的",@"长一点的",@"长一点的"].mutableCopy;
    
    NSMutableArray *contentArray = [NSMutableArray array];
    for (int i = 0; i < titleArray.count; i ++) {
        TitlePageVC1 *vc1 = [[TitlePageVC1 alloc]init];
        [contentArray addObject:vc1];
    }
    

    TitlePageView *titlePageView = [[TitlePageView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.bounds.size.height) contentArray:contentArray titleArray:titleArray titleViewStyle:style mainController:self];
    titlePageView.delegate = self;
    [self.view addSubview:titlePageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
