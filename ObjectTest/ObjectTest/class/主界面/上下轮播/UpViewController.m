//
//  ViewController.m
//  CCPScrollView
//
//  Created by C CP on 16/9/27.
//  Copyright © 2016年 C CP. All rights reserved.
/*
 
 特色
 支持竖直以及水平自动轮播
 没有侵入性，使用自定义的view
 自定的view支持纯代码或者xib
 采用类似UITableView的方式构建框架
 view重用机制的无限轮播，性能优异
 使用简易
 
 
 使用注意事项
 自定义view请继承 LPContentView，并且向LPAutoScrollView注册。
 使用代理方法赋值，在- (void)lp_scrollView: (LPAutoScrollView *)scrollView newsDataAtIndex: (NSUInteger)index forContentView: (LPContentView *)contentView 方法中，请自行更换LPContentView 为你自定义的view，然后模型赋值。
 两种滚动模式，默认竖直 LPAutoScrollViewStyleVertical,
 LPAutoScrollViewStyleHorizontal,
 
 
 */

#import "UpViewController.h"
#import "LPAutoScrollView.h"
#import "LPView.h"
#import "LPImageContentView.h"

@interface UpViewController () <LPAutoScrollViewDatasource, LPAutoScrollViewDelegate>

@property (nonatomic, weak) LPAutoScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *titlesArray;

@end

@implementation UpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.titlesArray = [NSMutableArray array];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        for (int i = 0; i < 3; i ++) {
            
            [self.titlesArray addObject:[NSString stringWithFormat:@"%d + avbdsgsdg", i]];
            
        }
        
        /**
         *  切记，数据源变化后记得调用 reload
         */
        [self.scrollView lp_reloadData];
        
    });
    
    /**
     *   此处更改滚动模式
     *   LPAutoScrollViewStyleHorizontal  水平
     *   LPAutoScrollViewStyleVertical    竖直
     *
     */
    
    LPAutoScrollView *scrollView = [[LPAutoScrollView alloc] initWithStyle:LPAutoScrollViewStyleVertical];
    
    //代理和数据源
    scrollView.lp_scrollDataSource = self;
    scrollView.lp_scrollDelegate = self;
    
    //数据数组为1时是否关闭滚动
    scrollView.lp_stopForSingleDataSourceCount = YES;
    
    //滚动市场
    scrollView.lp_autoScrollInterval = 3;
    
    
    //
    /**
     *  注册内容view
     *
     *  自定义view请继承 LPContentView
     *
     *  纯代码和xib随意切换
     */
    //    [scrollView lp_registerNib:[UINib nibWithNibName:NSStringFromClass([LPView class]) bundle:nil]];
    [scrollView lp_registerClass:[LPView class]];
    
    
    _scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    scrollView.frame = CGRectMake(0, 50, self.view.frame.size.width, 300);
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    self.scrollView.frame = CGRectMake(0, 50, self.view.frame.size.width, 300);
}

#pragma mark - LPAutoScrollViewDatasource

- (NSUInteger)lp_numberOfNewsDataInScrollView:(LPAutoScrollView *)scrollView {
    return self.titlesArray.count;
}

/**
 *
 *  @param contentView 更改为你自己创建的view类型，使用模型赋值，类似UITableView
 */
- (void)lp_scrollView:(LPAutoScrollView *)scrollView newsDataAtIndex:(NSUInteger)index forContentView:(LPView *)contentView {
    contentView.title = self.titlesArray[index];
}

#pragma mark LPAutoScrollViewDelegate

- (void)lp_scrollView:(LPAutoScrollView *)scrollView didTappedContentViewAtIndex:(NSUInteger)index {
    NSLog(@"%@", self.titlesArray[index]);
}

@end
