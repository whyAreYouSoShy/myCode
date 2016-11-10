//
//  BlockVC1.h
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/5.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "RootViewController.h"
#import "MyBlockVC.h"

@protocol BlockVC1Delegate <NSObject>

- (void)testWith:(NSString *)string;

@end


typedef void (^ReturnTextBlock)(NSString *testString);

typedef void (^requestSuccess)(id obj);

typedef void (^requestFaild)(id obj);

@interface BlockVC1 : RootViewController<MyBlockVCDelegate>

@property(nonatomic,copy) ReturnTextBlock returnTextblock;

- (void)returnText:(ReturnTextBlock)block;

- (void)testWithSuccess:(requestSuccess)success faild:(requestFaild)faild;


@property(nonatomic,assign) id<BlockVC1Delegate> delegate;






@end
