//
//  HUDViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/18.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "HUDViewController.h"
#import "MBProgressHUD.h"

@interface HUDViewController ()
{
    MBProgressHUD *HUD;
}

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    [self setupHUD1];
   
}



//带动画的
-(void)setupHUD2{
    
    
    NSMutableArray *imageArray=[[NSMutableArray alloc]init];
    
    for (int i =0; i<10; i++) {
        
        [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"loading_1_%d",i + 1]]];
        
    }

    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC));
    
    [MBProgressHUD showHUDWithImageArr:imageArray hudLabel:@"...." hudDetailLabel:@"-----" andShowView:self.view];
    
    self.view.userInteractionEnabled=NO;
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [MBProgressHUD dissmissShowView:(self.view)];
        self.view.userInteractionEnabled=YES;

        
    });
    
}


//基本的
-(void)setupHUD1{
    
    
    
    //HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD=[[MBProgressHUD alloc]initWithView:self.view];
    [self.view addSubview:HUD];
    
    /**
     *  1,设置动画的模式
     */
    HUD.mode = MBProgressHUDModeIndeterminate;//菊花，默认值
    //HUD.mode = MBProgressHUDModeDeterminate;//圆饼，饼状图
    //HUD.mode = MBProgressHUDModeDeterminateHorizontalBar;//进度条
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;//圆环作为进度条
    //HUD.mode = MBProgressHUDModeCustomView; //需要设置自定义视图时候设置成这个
    //HUD.mode = MBProgressHUDModeText; //只显示文本
    
    
    /**
     *  2,设置背景框的背景颜色和透明度
     */
    //HUD.bezelView.color = [UIColor colorWithRed:0 green:0 blue:0 alpha:.1];
    HUD.bezelView.color = [UIColor whiteColor];
    
    
    
    
    /**
     *  3,设置背景框的圆角值，默认是10
     */
    HUD.bezelView.layer.cornerRadius = 20.0;
    
    
    /**
     *  4,设置提示信息 信息颜色，字体
     */
    
    HUD.label.text = @"Loading...";
    HUD.label.textColor=[UIColor blueColor];
    HUD.label.font = [UIFont systemFontOfSize:13];
    
    /**
     *  5,设置提示信息详情 详情颜色，字体
     */
    HUD.detailsLabel.text = @"LoadingLoading...";
    HUD.detailsLabel.textColor = [UIColor blueColor];
    HUD.detailsLabel.font = [UIFont systemFontOfSize:13];
    
    /**
     *  6，设置菊花颜色  只能设置菊花的颜色
     */
    [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color=[UIColor blueColor];
    
    
    /**
     *  7,设置一个渐变层的颜色
     */
    HUD.backgroundView.color=[UIColor blueColor];
    
    /**
     *  8,设置提示框的相对于父视图中心点的便宜，正值 向右下偏移，负值左上
     */
    [HUD setOffset:CGPointMake(0, 0)];
    
    
    /**
     *  9,设置自定义的图片
     */
    
    
    
    
    //HUD.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test"]];
    
    
    //    for (int i =0; i<10; i++) {
    //
    //        HUD.customView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[imageArray objectAtIndex:i]]];
    //
    //    }
    
    /**
     *  10，设置各个元素距离矩形边框的距离
     */
    HUD.margin = 20;
    
    /**
     *  11，背景框的最小大小
     */
    HUD.minSize = CGSizeMake(50, 50);
    /**
     *  12,是否强制背景框宽高相等
     */
    HUD.square = YES;
    
    /**
     *  13,设置显示和隐藏动画类型  有三种动画效果
     */
    //HUD.animationType = MBProgressHUDAnimationFade; //默认类型的，渐变
    //HUD.animationType = MBProgressHUDAnimationZoomOut; //HUD的整个view后退 然后逐渐的后退
    HUD.animationType = MBProgressHUDAnimationZoomIn; //和上一个相反，前近，最后淡化消失
    
    
    
    /**
     *  14,设置最短显示时间，为了避免显示后立刻被隐藏   默认是0
     */
    HUD.minShowTime = 10;
    
    
    /**
     *  15,设置隐藏的时候是否从父视图中移除，默认是NO
     */
    //HUD.removeFromSuperViewOnHide = NO;
    
    /**
     *  16,进度指示器  模式是0，取值从0.0————1.0
     */
    //HUD.progress = 0.5;
    
    /**
     *  17,隐藏时候的回调 隐藏动画结束之后
     */
    //    HUD.completionBlock = ^(){
    //        NSLog(@"abnnfsfsf");
    //    };
    
    
    
    
    /**
     *  18,显示的方法
     */
    [HUD showAnimated:YES];
    
    
    /**
     *  19,两种隐藏的方法
     */
    //    [HUD hideAnimated:YES];
    //    [HUD hideAnimated:YES afterDelay:5];
    
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"------");
}



@end
