//
//  SkillDetailController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "SkillDetailController.h"
#import "HYBIPHelper.h"//获取设备的ip地址
#import "AFNetworking.h"
#import "NSString+Chinese.h"

//警告框
#define setAlertController(title)  UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:title delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil]; [alertView show];



@interface SkillDetailController ()

@end

@implementation SkillDetailController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title =@"11";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.view.backgroundColor=[UIColor whiteColor];
    NSArray *titleArray=@[@"获取ip地址",@"获取网络状态",@"毛玻璃",@"防止按钮重复点击",@"设置按钮部分圆角和阴影",@"判断是否是第一次启动",@"添加边框和边框颜色",@"设置导航栏按钮",@"中文判断"];
   
   
    
    for (int i = 0; i < 9; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(30+100*(i/3), 80*(i%3)+80, 60, 60);
        button.tag=i+1;
        button.titleLabel.numberOfLines=0;
        button.titleLabel.font=[UIFont systemFontOfSize:10];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor redColor];
        [self.view addSubview:button];
    }
    
    
}


#pragma mark-----button的点击事件

-(void)btnClick:(UIButton *)button{

    if (button.tag==1) {
        
        //获取设备的ip地址
        NSString *ipString=[NSString stringWithFormat:@"设备的ip地址为:%@",[HYBIPHelper deviceIPAdress]];
        setAlertController(ipString);
    
    }else if (button.tag==2){
        
        //根据状态栏获取网络状态
        NSString *string=[self getNetWorkStates];
        setAlertController(string);
        
        //根据AFNetWorking获取网络状态
        [self AFNetworkStatus];
        
    }else if (button.tag==3){
        
        //设置毛玻璃
        UIBlurEffect  *blurEffect= [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView  *diaryStartEditingBlurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        diaryStartEditingBlurView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        diaryStartEditingBlurView.alpha=.8;
        [self.view addSubview:diaryStartEditingBlurView];

    }else if (button.tag==4){
        //先将未到时间执行前的任务取消。
        
        [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(todoSomething:) object:button];
        [self performSelector:@selector(todoSomething:) withObject:button afterDelay:0.2f];
    

    }else if (button.tag==5){
        
        //设置按钮部分圆角
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:button.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft cornerRadii:CGSizeMake(5, 5)];
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = button.bounds;
//        maskLayer.path = maskPath.CGPath;
//        button.layer.mask = maskLayer;
        
//        此时需要考虑对button的layer进行设置
//        button layer 设置以下几个属性
//        cornerRadius;
//        shadowOffset
//        shadowOpacity;
//        shadowColor;
//        代码如下
        
         button.layer.cornerRadius = 5;
         button.layer.shadowOffset =  CGSizeMake(1, 1);
         button.layer.shadowOpacity = 0.8;
         button.layer.shadowColor =  [UIColor blackColor].CGColor;
        
        
        setAlertController(@"设置按钮部分圆角和阴影");
        

    }else if (button.tag==6){
        
        if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]){
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
            //第一次启动
            setAlertController(@"第一次启动");
            }else{
            //不是第一次启动了
            setAlertController(@"不是第一次启动");
            }
        
        
        
        
    }else if (button.tag==7){
        //添加边框和边框颜色
        button.layer.borderWidth=3;
        button.layer.borderColor=[[UIColor blueColor]CGColor];
        setAlertController(@"添加边框和边框颜色");

        
    }else if (button.tag==8){
        
        NSLog(@"--------%f------%f",self.navigationController.navigationBar.frame.size.width,self.view.frame.size.width);
        //
        
        //
        CGFloat navigationBarWidth = self.navigationController.navigationBar.frame.size.width;
        
        UIView * bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, navigationBarWidth, 38)];
        bgView.backgroundColor = [UIColor redColor];
        
        self.navigationItem.titleView = bgView;
        
        NSArray *titleArray = @[@"分/K", @"时/K", @"日/K", @"周/K"];
        
        for (int i = 0; i < titleArray.count ; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(navigationBarWidth / 4 * i, 0, navigationBarWidth / 4, 38);
            [button setTitle:titleArray[i] forState:(UIControlStateNormal)];
            [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [bgView addSubview:button];
        }
    }else if (button.tag==9){
        
        NSString *string1=@"zhongguo123中国";
        
        if ([string1 includeChinese]==0) {
            [button setTitle:@"不含中文" forState:(UIControlStateNormal)];
        }else{
            [button setTitle:@"含中文" forState:(UIControlStateNormal)];
        }
    }
}

#pragma mark----- 根据状态栏获取网络状态
//根据状态栏获取网络状态，可以区分2G、3G、4G、WIFI，系统的方法，比较快捷。稍微蛋疼的是万一连接的WIFI没有联网的话···你懂得
-(NSString *)getNetWorkStates{
    
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *children = [[[app valueForKeyPath:@"statusBar"]valueForKeyPath:@"foregroundView"]subviews];
    NSString *state = [[NSString alloc]init];
    int netType = 0;
    //获取到网络返回码
    for (id child in children) {
        if ([child isKindOfClass:NSClassFromString(@"UIStatusBarDataNetworkItemView")]) {
            //获取到状态栏
            netType = [[child valueForKeyPath:@"dataNetworkType"]intValue];
            
            switch (netType) {
                case 0:
                    state = @"无网络";
                    //无网模式
                    break;
                case 1:
                    state = @"2G";
                    break;
                case 2:
                    state = @"3G";
                    break;
                case 3:
                    state = @"4G";
                    break;
                case 5:
                {
                    state = @"WIFI";
                }
                    break;
                default:
                    break;
            }
        }
    }
    //根据状态选择
    return state;
}


#pragma mark----- 根据AFNetWorking获取网络状态
- (void)AFNetworkStatus{
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"---未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"---无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"---蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"---WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;
    
    //开始监听
    [manager startMonitoring];
}



#pragma mark-----按钮防止重复点击的防止方法
- (void)todoSomething:(UIButton *)sender
{
    //在这里做按钮的想做的事情。
    
    NSLog(@"------按钮重复点击");
    setAlertController(@"防止按钮重复点击");
    
}




@end
