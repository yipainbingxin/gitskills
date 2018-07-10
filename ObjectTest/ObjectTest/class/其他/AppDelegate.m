//
//  AppDelegate.m
//  ObjectTest
//
//  Created by BlueDream on 16/8/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SkillViewController.h"
#import "MyUIViewController.h"
#import "introductoryPagesHelper.h"//引导页第三方1
#import "DHGuidePageHUD.h"//引导页第三方2

#import "AdvertiseHelper.h"//广告启动第三方
#import "RootTabBarController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [RootTabBarController new];
   
   //App版本号
   NSString *string= [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
   NSLog(@"----------%@",string);
    NSLog(@"----------我是新添加的内容哦88888888");

    
    
    
    //引导页
    [self setupIntroductoryPage];
    
    //启动广告（记得放最后，才可以盖在页面上面）
    //[self setupAdveriseView];
    
    //处理点击启动广告的操作
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToAd) name:@"AdvertisePush" object:nil];
  
    return YES;
}


#pragma mark-----设置引导页

-(void)setupIntroductoryPage
{
    //第一次启动显示引导
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        
        
        // 静态引导图
        // NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
        
        // 动态引导图
        NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];

        //DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
        //[self.navigationController.view addSubview:guidePage];

        DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.window.frame imageNameArray:imageNameArray buttonIsHidden:YES];
        [self.window addSubview:guidePage];
        
        
        
        //设置引导页
        //NSArray *images=@[@"introductoryPage1",@"introductoryPage2",@"introductoryPage3",@"introductoryPage4"];
        //[introductoryPagesHelper showIntroductoryPageView:images];
        NSLog(@"第一次启动");
    }
    else
    {
        NSLog(@"已经不是第一次启动了");
    }

}

#pragma mark-----启动广告
-(void)setupAdveriseView
{
    // TODO 请求广告接口 获取广告图片
    
    //现在了一些固定的图片url代替
    NSArray *imageArray = @[@"http://imgsrc.baidu.com/forum/pic/item/9213b07eca80653846dc8fab97dda144ad348257.jpg", @"http://pic.paopaoche.net/up/2012-2/20122220201612322865.png", @"http://img5.pcpop.com/ArticleImages/picshow/0x0/20110801/2011080114495843125.jpg", @"http://www.mangowed.com/uploads/allimg/130410/1-130410215449417.jpg"];
    
    [AdvertiseHelper showAdvertiserView:imageArray];
}


#pragma mark-----处理点击启动广告的操作
-(void)pushToAd{
    NSLog(@"处理点击启动广告的操作");
}



@end
