//
//  BasicRunTimeVC.m
//  MyDemo
//
//  Created by 叶贵忠 on 2016/11/13.
//  Copyright © 2016年 yeguizhong. All rights reserved.
//

#import "BasicRunTimeVC.h"
#import <objc/runtime.h>
#import "Person.h"



NSInteger count = 0;


@interface BasicRunTimeVC ()

@property(nonatomic,strong) NSMutableArray *array;

@end

@implementation BasicRunTimeVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"runtime基础";
    
    [self timerTest];
    
//    self.array = [NSMutableArray array];÷
    
    self.array = nil;
    
    Method method1 = class_getClassMethod([Person class], @selector(run));
    Method method2 = class_getClassMethod([Person class], @selector(study));
    method_exchangeImplementations(method1, method2);
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 20)];
    label.text = @"hahahahha";
    label.backgroundColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:label];
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.array addObject:@""];
    
    NSLog(@"%@",self.array[0]);
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [Person run];
    [Person study];
}



- (void)timerTest {
    
   
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC, 0.5 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        
        count ++ ;
        
        NSLog(@"这是第%ld次执行了",count);
        
        if (count > 5) {
            
            dispatch_cancel(timer);
        }
    });
    dispatch_resume(timer);
}











@end
