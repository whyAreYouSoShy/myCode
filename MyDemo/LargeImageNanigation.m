//
//  LargeImageNanigation.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/4.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "LargeImageNanigation.h"
#import "CopyTBGoodsDetailVC.h"
const CGFloat imageHeight = 200;

@interface LargeImageNanigation ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation LargeImageNanigation
{
    UIImageView *imageV;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationBar];
    [self initTableView];
}

- (void)setNavigationBar {
    self.title = @"导航栏变化";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    self.navigationController.navigationBar.alpha = 0;
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, XSWidth, XSHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(imageHeight, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -imageHeight, XSWidth, imageHeight)];
    imageV.image = [UIImage imageNamed:@"BGimage.jpg"];
    [self.tableView addSubview:imageV];
    
}






- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetY = scrollView.contentOffset.y;
    
//    CGFloat scale = 0.5;
    
    if (offSetY < -imageHeight) {//下拉
        CGRect frame = imageV.frame;
        frame.origin = CGPointMake((offSetY+imageHeight)*XSWidth/(imageHeight*2), offSetY);
        frame.size = CGSizeMake(XSWidth*fabs(offSetY)/imageHeight, fabs(offSetY));
        imageV.frame = frame;
    }
    
    NSLog(@"%@    %f",NSStringFromCGRect(imageV.frame),offSetY);
    
    
    //设置导航栏的透明
    CGFloat d = imageHeight - 64;
    CGFloat alpha = (offSetY+imageHeight)/d;
    self.navigationController.navigationBar.alpha = alpha;
    
}






- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        cell.textLabel.text = @"点我看下一个domo";
        cell.textLabel.font = [UIFont systemFontOfSize:25];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CopyTBGoodsDetailVC *vc = [[CopyTBGoodsDetailVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationController.navigationBar.alpha = 1;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

@end
