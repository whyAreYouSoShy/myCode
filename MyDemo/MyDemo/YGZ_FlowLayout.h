//
//  YGZ_FlowLayout.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/3.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGZ_FlowLayout : UICollectionViewFlowLayout

@property(nonatomic,copy) void(^didScrollAtIndex)(NSInteger index);

@end