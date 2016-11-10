//
//  MyFlowlayoutVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/3.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "MyFlowlayoutVC.h"
#import "YGZ_FlowLayout.h"
#import "test4Cell.h"
@interface MyFlowlayoutVC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,assign) NSInteger currentItem;

@end

@implementation MyFlowlayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"collectionViewCellLayout";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initCollectionView];
}

- (void)initCollectionView {
    self.dataArray = [NSMutableArray array];
    for (int i = 0; i < 200; i ++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"title%d",i]];
    }
    YGZ_FlowLayout *layout = [[YGZ_FlowLayout alloc]init];
    __weak MyFlowlayoutVC *ws = self;
    [layout setDidScrollAtIndex:^(NSInteger index) {
        ws.currentItem = index;
    }];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 164, XSWidth, 160) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    NSIndexPath *index = [NSIndexPath indexPathForItem:self.dataArray.count/2 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[test4Cell class] forCellWithReuseIdentifier:@"cell4"];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    test4Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
    cell.myLabel.text = self.dataArray[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    滑动结束时调用，不使用动画以实现无缝回滚到中间对应条目
    NSIndexPath *index = [NSIndexPath indexPathForItem:self.currentItem inSection:0];
    [self.collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
}



@end
