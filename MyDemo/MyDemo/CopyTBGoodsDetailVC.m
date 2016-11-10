//
//  CopyTBGoodsDetailVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/4.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "CopyTBGoodsDetailVC.h"

@interface CopyTBGoodsDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) UIView *coverView;

@end

@implementation CopyTBGoodsDetailVC
{
    UIImageView *headImageV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XSWidth, XSHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    headImageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, XSWidth, 350)];
    headImageV.image = [UIImage imageNamed:@"BGimage.jpg"];
    self.tableView.tableHeaderView = headImageV;
    [self.tableView sendSubviewToBack:headImageV];
    
    [self initCoverView];
}

- (void)initCoverView {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    self.coverView = [[UIView alloc]initWithFrame:CGRectMake(0, XSHeight, XSWidth, XSHeight)];
    self.coverView.backgroundColor = [UIColor colorWithHexString:@"333333" alpha:0.5];
    self.coverView.userInteractionEnabled = YES;
    [self.coverView addGestureRecognizer:tap];
    [self.view addSubview:self.coverView];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, XSHeight/3, XSWidth, XSHeight/3*2)];
    redView.backgroundColor = [UIColor redColor];
    [self.coverView addSubview:redView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        
        cell.textLabel.text = @"点我试试";
        cell.textLabel.font = [UIFont systemFontOfSize:30];
    }
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    
//    [headImageV setY:0];
    if (offsetY >= 0 && offsetY <= 350) {
        CGRect frame = headImageV.frame;
        frame.origin = CGPointMake(0, -offsetY/2);
        frame.size = CGSizeMake(XSWidth, 350);
        headImageV.frame = frame;
        [self.tableView sendSubviewToBack:headImageV];
    }
//    NSLog(@"%.f===%@",offsetY,NSStringFromCGRect(headImageV.frame));
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGPoint center = self.tableView.center;
    center.y -= 80;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration:0.2 animations:^{
        self.coverView.frame = CGRectMake(0, 0, XSWidth, XSHeight);
        self.tableView.center = center;
    }];
    
    self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.7, 0.7);
    
}

- (void)tapClick {
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    CGPoint center = self.tableView.center;
    center.y += 80;
    [UIView animateWithDuration:0.25 animations:^{
        self.tableView.center = center;
        self.coverView.frame = CGRectMake(0, XSHeight, XSWidth, XSHeight);
    }];
    
    self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
}





@end
