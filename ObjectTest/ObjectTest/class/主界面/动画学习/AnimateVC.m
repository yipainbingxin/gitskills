//
//  AnimateVC.m
//  ObjectTest
//
//  Created by bing on 2018/7/10.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "AnimateVC.h"

@interface AnimateVC ()
@property(nonatomic,strong)UIView *redview;
@end
@implementation AnimateVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"基础动画";
    _redview=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    _redview.backgroundColor=[UIColor redColor];
    [self.view addSubview:_redview];
    
    
    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:100];
    [UIView setAnimationRepeatAutoreverses: YES];  // 翻转
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn]; //设置动画变化的曲线
    UIView *view =  self.redview;
    view.alpha = 0;
    view.center = CGPointMake(view.center.x + 100, view.center.y+100);
    [UIView setAnimationDelegate:self];   // 设置代理 监测动画结束的
    [UIView setAnimationDidStopSelector:@selector(shopAction)];
    [UIView commitAnimations];
}
-(void)shopAction{
    NSLog(@"动画结束了哦");
}
@end
