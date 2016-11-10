//
//  YGZ_FlowLayout.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/3.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "YGZ_FlowLayout.h"

@implementation YGZ_FlowLayout


- (instancetype)init {
    self = [super init];
    return self;
}


#pragma mark-----  是否要重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


#pragma mark-----  设置layout的属性值
- (void)prepareLayout {
    [super prepareLayout];
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    CGFloat itemWH = 80;
    self.itemSize = CGSizeMake(itemWH, itemWH);
    
//    CGFloat inset = (self.collectionView.frame.size.width - itemWH) * 0.5;
    self.sectionInset = UIEdgeInsetsMake(-20, 0, 20, 0);
    self.minimumLineSpacing = -self.collectionView.frame.size.width/10.7;
//    self.minimumInteritemSpacing = -self.collectionView.frame.size.width/10.7;
    //设置collectionView与边界的距离
//    CGFloat inset = (CGRectGetWidth(self.collectionView.frame) - itemWH)*0.5;
//    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    
//    //计算collectionView的中心点的x值
//    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
//    
//    //进行微调
//    for (UICollectionViewLayoutAttributes *attrs in array) {
//        //cell的中心点x和collectionView最中心点的x值 的间距
//        CGFloat delta = ABS(attrs.center.x - centerX);
//        //根据间距值计算cell的缩放比例
//        CGFloat scale = 1 - delta/self.collectionView.frame.size.width;
//        attrs.transform = CGAffineTransformMakeScale(scale, scale);
//    }
//    
//    return array;
    
    
    #pragma mark-----  另一种
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    CGFloat centerX = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.frame)*0.5;
    
    static NSInteger currentItem = 0;
    
    
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat delta = ABS(centerX - attrs.center.x);
        CGFloat t = delta/(CGRectGetWidth(self.collectionView.frame)/2);
        CGFloat scale = 0.55 +0.45*(1-t);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
        

        if (delta<10 && currentItem!=attrs.indexPath.item) {
            currentItem = attrs.indexPath.item;
            
            if (self.didScrollAtIndex) {
                self.didScrollAtIndex(attrs.indexPath.item);
            }
        }
        //    弧形排列
        attrs.center = CGPointMake(attrs.center.x,self.collectionView.frame.size.height*0.3+self.collectionView.frame.size.height*0.45*(1-t*t));
    }
    

    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //设置层叠状态,中间的zIndex为0,越远的越小,越靠后
        attrs.zIndex = -ABS(attrs.indexPath.item - currentItem);
    }
    
    
    return array;
}


#pragma mark-----  这个方法的返回值,决定了collectionView停止滚动是的偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    //计算出最终显示的矩形框
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attrs in array) {
        
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            
            minDelta = attrs.center.x - centerX;
            
        }
    }
    
    // 修改原有的偏移量
    return CGPointMake(proposedContentOffset.x + minDelta, proposedContentOffset.y);
    
}






























@end
