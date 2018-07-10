//
//  CarouselViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/11.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "CarouselViewController.h"
#import "CarouselView.h"

@interface CarouselViewController ()<CarouselViewDelegate>

@end

@implementation CarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //本地图片
    NSArray *arr1 = @[[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"]];
    //网络图片
    NSArray *arr2 = @[@"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", @"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", @"http://file27.mafengwo.net/M00/B2/12/wKgB6lO0ahWAMhL8AAV1yBFJDJw20.jpeg"];
    
    //既有本地图片也有网络图片
    NSArray *arr3 = @[@"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", [UIImage imageNamed:@"2.jpg"], @"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", [UIImage imageNamed:@"1.jpg"]];
    //图片的描述
    NSArray *describeArray = @[@"这是第一张图片的描述", @"这是第二张图片的描述", @"这是第三张图片的描述", @"这是第四张图片的描述"];
    
    /**
     *  通过代码创建
     */
    CarouselView  *carouselView = [CarouselView carouselViewWithImageArray:arr3 describeArray:describeArray];
    
    
    //设置frame
    carouselView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180);
    
    
    //用代理处理图片点击
    carouselView.delegate = self;
    
    
    //设置每张图片的停留时间
    carouselView.time = 2;
    
    //设置分页控件的图片,不设置则为系统默认
    [carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
    //设置分页控件指示器的颜色
    //[carouselView setPageColor:[UIColor blueColor] andCurrentPageColor:[UIColor redColor]];
    
    //设置分页控件的位置，默认为PositionBottomCenter
    carouselView.pagePosition = PositionBottomRight;
    
    //设置图片切换的方式
    
    //ChangeModeDefault,  //轮播滚动
    //ChangeModeFade      //淡入淡出
    carouselView.changeMode = ChangeModeDefault;
    
    //用block处理图片点击事件
    //carouselView.imageClickBlock = ^(NSInteger index){
        //NSLog(@"点击了第%ld张图片", index);
    //};

    
    
    /**
     *  修改图片描述控件的外观，不需要修改的传nil
     *
     *  参数一 字体颜色，默认为白色
     *  参数二 字体，默认为13号字体
     *  参数三 背景颜色，默认为黑色半透明
     */
    UIColor *bgColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    UIFont *font = [UIFont systemFontOfSize:15];
    UIColor *textColor = [UIColor greenColor];
    [carouselView setDescribeTextColor:textColor font:font bgColor:bgColor];
    
    //轮播开始
    [carouselView startTimer];
    
    //轮播停止
    [carouselView stopTimer];
    
    [self.view addSubview:carouselView];
 
    

}







#pragma mark XRCarouselViewDelegate
- (void)carouselView:(CarouselView *)carouselView didClickImage:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}





@end
