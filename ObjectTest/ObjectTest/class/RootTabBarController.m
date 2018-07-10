//
//  RootTabBarController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/23.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "RootTabBarController.h"
#import "MainViewController.h"
#import "SkillViewController.h"
#import "MyUIViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //视图数组
    
    NSArray    *viewArray=@[@"MainViewController",@"SkillViewController",@"MyUIViewController"];
    
    //标题数组
    NSArray *titleArray=@[@"首页",@"技巧",@"UI控件"];
    //正常图片数组
    NSArray *normalImageArr =@[@"首页",@"订单",@"我的"];
    //选中图片数组
    NSArray *selectImageArr =@[@"shouye-icon",@"订单2",@"wo-d"];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<viewArray.count; i++) {
        
        UIViewController *viewController = [[NSClassFromString(viewArray[i]) alloc] init];
        //设置标题
        viewController.title = titleArray[i];
        
        //设置图片
        viewController.tabBarItem.image = [[UIImage imageNamed:normalImageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置选中图片
        viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        [navArray addObject:navigationController];
    }
    
    
    self.viewControllers = navArray;
    
    //设置UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    
    //未选中的颜色,字体和大小
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:14.0f]} forState:UIControlStateNormal];
    //选中的颜色,字体和大小
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:14.0f]} forState:UIControlStateSelected];
    //self.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"1.jpg"];
    //self.tabBar.backgroundImage = [UIImage imageNamed:@"80"];
    /*
    
    //设置tabbar的背景颜色(图片)
    UIView*mView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.tabBar.frame.size.height)];
    mView.alpha=0.8;
 
    //[mView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar.png"]]];
    mView.backgroundColor=[UIColor redColor];
    [self.tabBar insertSubview:mView atIndex:0];
    
    */
    
    //UITabBar,移除顶部的阴影
    //[[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    //[[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];

}


@end
