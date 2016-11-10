//
//  MainController.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/10/27.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MainController.h"
#import "MainCell.h"
#import <LocalAuthentication/LocalAuthentication.h>//指纹解锁用


#import "DrawerVC.h"
#import "TitlePageViewVC.h"
#import "ViewAppearAnimateVC.h"
#import "MyFlowlayoutVC.h"
#import "LargeImageNanigation.h"
#import "MyBlockVC.h"
#import "CoreLockVC.h"
#import "AnimationVC.h"
@interface MainController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"入口";
    
    [self initData];
    
    [self initCollectionView];
}





- (void)initData {
    self.dataArray = [[NSMutableArray alloc]init];
    self.dataArray = @[@"抽屉模型",@"滑动视图",@"页面出现动画",@"重写flowlayout",@"下拉导航栏",@"block",@"图案解锁",@"基本动画"].mutableCopy;
}


- (void)initCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[MainCell class] forCellWithReuseIdentifier:@"mainCell"];
    [self.view addSubview:self.collectionView];
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mainCell" forIndexPath:indexPath];
    cell.cellTitle.text = self.dataArray[indexPath.row];
    cell.contentView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width/2, 60);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:{
            DrawerVC *vc = [[DrawerVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 1:{
            TitlePageViewVC *vc = [[TitlePageViewVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 2:{
            ViewAppearAnimateVC *vc = [[ViewAppearAnimateVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 3:{
            MyFlowlayoutVC *vc = [[MyFlowlayoutVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 4:{
            LargeImageNanigation *vc = [[LargeImageNanigation alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 5:{
            MyBlockVC *vc = [[MyBlockVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 6:{
            CoreLockVC *vc = [[CoreLockVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
        case 7:{
            AnimationVC *vc = [[AnimationVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        default:
            break;
    }
}











//typedef NS_ENUM(NSInteger, LAError)
//{
//    //授权失败
//    LAErrorAuthenticationFailed = kLAErrorAuthenticationFailed,
//
//    //用户取消Touch ID授权
//    LAErrorUserCancel           = kLAErrorUserCancel,
//
//    //用户选择输入密码
//    LAErrorUserFallback         = kLAErrorUserFallback,
//
//    //系统取消授权(例如其他APP切入)
//    LAErrorSystemCancel         = kLAErrorSystemCancel,
//
//    //系统未设置密码
//    LAErrorPasscodeNotSet       = kLAErrorPasscodeNotSet,
//
//    //设备Touch ID不可用，例如未打开
//
//    LAErrorTouchIDNotAvailable  = kLAErrorTouchIDNotAvailable,
//
//    //设备Touch ID不可用，用户未录入
//    LAErrorTouchIDNotEnrolled   = kLAErrorTouchIDNotEnrolled,
//} NS_ENUM_AVAILABLE(10_10, 8_0);



@end
