//
//  CollectionViewPlugVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/12/18.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "CollectionViewPlugVC.h"

#import "DemoCell.h"

@interface CollectionViewPlugVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>


@property(nonatomic,strong)UICollectionView *collectionView;


@end

const CGFloat topHeight = 200;

@implementation CollectionViewPlugVC
{
    UIImageView *imageV;
}
- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        CGFloat width = XSWidth * 0.25;
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize = CGSizeMake(width, width);
        
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        layout.minimumLineSpacing = 0.f;
        
        layout.minimumInteritemSpacing = 0.f;
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, XSWidth, XSHeight  - 49) collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        
        _collectionView.dataSource = self;
        
        _collectionView.contentInset = UIEdgeInsetsMake(topHeight, 0, 0, 0);
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerClass:[DemoCell class] forCellWithReuseIdentifier:@"democell"];
        
        imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -topHeight, XSWidth, topHeight)];
        
        imageV.image = [UIImage imageNamed:@"BGimage.jpg"];
        
        [_collectionView addSubview:imageV];

        
    }
    
    return _collectionView;
}




- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"democell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
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




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setNav];
    
    [self.view addSubview:self.collectionView];
    
    
    
    
}


- (void)setNav {
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    self.navigationController.navigationBar.alpha = 0;
    
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSetY = scrollView.contentOffset.y;
    
    //    CGFloat scale = 0.5;
    
    if (offSetY < -topHeight) {//下拉
        
        CGRect frame = imageV.frame;
        
        frame.origin = CGPointMake((offSetY+topHeight)*XSWidth/(topHeight*2), offSetY);
        
        frame.size = CGSizeMake(XSWidth*fabs(offSetY)/topHeight, fabs(offSetY));
        
        imageV.frame = frame;
    }
    
    
    //设置导航栏的透明
//    CGFloat d = topHeight - 64;
//    
//    CGFloat alpha = (offSetY+topHeight)/d;
//    
//    self.navigationController.navigationBar.alpha = alpha;
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
