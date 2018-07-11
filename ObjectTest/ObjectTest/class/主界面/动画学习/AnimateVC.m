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
@property(nonatomic,strong)NSMutableArray *viewArray;
@property(nonatomic,strong)CALayer *rectLayer;
@property(nonatomic,strong)UIImageView *imagev;
@end
@implementation AnimateVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"基础动画";
    _viewArray=[[NSMutableArray alloc]initWithCapacity:0];
    [self crateViews];
    NSLog(@"基础动画的使用");
    _redview=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    _redview.backgroundColor=[UIColor redColor];
    _imagev=[[UIImageView alloc]initWithFrame:CGRectMake(0, 100, 200, 100)];
    _imagev.image=[UIImage imageNamed:@"guideImage7"];
    _imagev.contentMode=UIViewContentModeCenter;
    _imagev.layer.backgroundColor=[UIColor orangeColor].CGColor;
    [self.view addSubview:_imagev];
    
    
    [self.view addSubview:_redview];
//    [self showAnimateWihtProperty];
//    [self showAnimateWihtBlock];
    [self showLayerAnimaite];
    
}
-(void)showLayerAnimaite{
    UIView *view=self.redview;
    view.layer.borderWidth = 6;
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.cornerRadius = 10;
    view.layer.anchorPoint=CGPointMake(0, 20);
    view.layer.position=CGPointMake(20, 20);

    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"position.x"];
    basicAnimation.fromValue=@(-112);
    basicAnimation.toValue=@(425);
    basicAnimation.repeatCount=MAXFLOAT;
    basicAnimation.duration=1;
    [view.layer addAnimation:basicAnimation forKey:nil];
    

    CABasicAnimation *basicAnimation1=[CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    basicAnimation1.fromValue=@(M_PI_2);
    basicAnimation1.toValue=@(M_PI);
    basicAnimation1.repeatCount=MAXFLOAT;
    basicAnimation1.autoreverses = YES;
    basicAnimation1.repeatCount = HUGE_VALF;
    [view.layer addAnimation:basicAnimation1 forKey:nil];

    // 关键帧动画
    // 指定动画需要修改的属性
    CAKeyframeAnimation *keyFrameA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 获得起始的点
    CGPoint point1 = self.redview.layer.position;
    // 第二个点
    CGPoint point2 = CGPointMake(375 / 2.0, point1.y);
    // 第三个点
    CGPoint point3 = CGPointMake(375/4, point1.y+50);
    // 第四个点
    CGPoint point4 = point1;
    NSValue *pointV1 = [NSValue valueWithCGPoint:point1];
    NSValue *pointV2 = [NSValue valueWithCGPoint:point2];
    NSValue *pointV3 = [NSValue valueWithCGPoint:point3];
    NSValue *pointV4 = [NSValue valueWithCGPoint:point4];
    keyFrameA.values = @[pointV1,pointV2,pointV3,pointV4];
    // 设置每帧动画的起始和结束点
    keyFrameA.duration = 5;
    // 设置重复的次数
    keyFrameA.repeatCount = 1000;
    //将动画添加到指定的控件的layer上；
    [self.redview.layer addAnimation:keyFrameA forKey:nil];
#pragma mark -------------绕矩形环跑
    //绕矩形循环跑
    CALayer * rectLayer = [[CALayer alloc] init];
    rectLayer.frame = CGRectMake(15, 200, 30, 30);
    rectLayer.cornerRadius = 15;
    rectLayer.backgroundColor = [[UIColor blackColor] CGColor];
    [self.view.layer addSublayer:rectLayer];
    
//    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CAKeyframeAnimation *rectRunAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //设定关键帧位置，必须含起始与终止位置
    rectRunAnimation.values = @[[NSValue valueWithCGPoint:rectLayer.frame.origin],
                                [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width - 15,rectLayer.frame.origin.y)],
                                [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width - 15,  rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:CGPointMake(15, rectLayer.frame.origin.y + 100)],
                                [NSValue valueWithCGPoint:rectLayer.frame.origin]];
       rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.6],[NSNumber numberWithFloat:0.7], [NSNumber numberWithFloat:0.8], [NSNumber numberWithFloat:1]];rectRunAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    rectRunAnimation.repeatCount = 1000;
    rectRunAnimation.autoreverses = NO;
    rectRunAnimation.calculationMode = kCAAnimationLinear;
    rectRunAnimation.duration = 4;
    rectRunAnimation.removedOnCompletion = NO;
    rectRunAnimation.fillMode = kCAFillModeForwards;
    [rectLayer addAnimation:rectRunAnimation forKey:@"rectRunAnimation"];
    self.rectLayer = rectLayer;
    

#pragma mark ---------抖动动画
    // 抖动示例
    // 创建帧动画对象
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    // 设置动画属性
    anim.keyPath = @"transform.rotation";
    anim.values = @[@(-100), @(100)];
    // 设置动画执行次数
    anim.repeatCount = HUGE_VALF;
    // 设置动画的执行时长
    anim.duration = 1;
    // 设置动画的自动反转效果
    anim.autoreverses = YES;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
//    / 将动画效果添加到lionImage的layer上
    [self.imagev.layer addAnimation:anim forKey:nil];
}
-(void)crateViews{
    //      总列数
    int totalColumns = 3;
    //       每一格的尺寸
    CGFloat cellW = 50;
    CGFloat cellH = 50;
    //    间隙
    CGFloat margin =(self.view.frame.size.width - totalColumns * cellW) / (totalColumns + 1);
    //    根据格子个数创建对应的框框
    for(int index = 0; index< 9; index++) {
        UIView *cellView = [[UIView alloc ]init ];
        cellView.backgroundColor = [UIColor blueColor];
        // 计算行号  和   列号
        int row = index / totalColumns;
        int col = index % totalColumns;
        //根据行号和列号来确定 子控件的坐标
        CGFloat cellX = margin + col * (cellW + margin);
        CGFloat cellY = row * (cellH + margin);
        cellView.frame = CGRectMake(cellX, cellY+200, cellW, cellH);
        // 添加到view 中
        [self.view addSubview:cellView];
        [_viewArray addObject:cellView];
        
    }
    

}
-(void)showAnimateWihtBlock{
//    第一种 顺时针旋转
    [UIView animateWithDuration:0.5 animations:^{
        UIView *view = self.viewArray[4];
        view.transform = CGAffineTransformRotate(view.transform, M_2_PI); // 顺时针旋转
    }];
    
    //    第二种
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[5];
        view.transform = CGAffineTransformMakeScale(2, 1);//宽高伸缩比例;
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[5];
            view.backgroundColor = [UIColor colorWithRed: arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/ 255.0  alpha:1.0];
        }
    }];
//    第三种
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[6];
        view.transform = CGAffineTransformMakeTranslation(300, 6);//xy移动距离;
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[6];
            view.backgroundColor = [UIColor colorWithRed: arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/ 255.0  alpha:1.0];
        }
    }];
    
//    四个
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[7];
        view.transform = CGAffineTransformMake(1.5, 1, 2, 2, 1,1);//自定义形变,参数自拟;
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[7];
            view.backgroundColor=[UIColor redColor];
        }
    }];
//      第五个
    [UIView animateKeyframesWithDuration:0.5 delay:0.1 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[2];
        view.transform = CGAffineTransformRotate(view.transform, M_2_PI); // 顺时针旋转
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[2];
            view.backgroundColor = [UIColor redColor];
        }
    }];
    
    // 弹簧效果  // 一  动画执行的时间   二  动画延迟执行的时间  第三个  弹簧震动的频率 0 - 1 值越小频率越高 四 弹簧的起始抖动的速度  五 代表动画的效果  六 具体执行的动画   七 执行完之后 的操作
    [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        UIView *view = self.viewArray[0];
        if (view.center.x > 300) {
            view.center = CGPointMake(0, view.center.y);
        }else{
            view.center = CGPointMake(view.center.x + 2, view.center.y);
        }
    } completion:^(BOOL finished) {
        
    }];
}
-(void)showAnimateWihtProperty{
    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:100];
    [UIView setAnimationRepeatAutoreverses: YES];  // 翻转
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut]; //设置动画变化的曲线
//    UIViewAnimationCurveEaseOut 开始快之后变慢
//    UIViewAnimationCurveEaseIn开始慢后来快
//    UIViewAnimationCurveEaseInOut：这种曲线的动画开始缓慢，在其持续时间的中间加速，然后在完成之
//    前再次减慢。这是大多数动画的默认曲线
//    UIViewAnimationCurveLinear：在动画持续时间内，动画匀速运行。
    UIView *view =  self.redview;
    view.alpha = 0;
    view.center = CGPointMake(view.center.x + 300, view.center.y);
    [UIView setAnimationDelegate:self];   // 设置代理 监测动画结束的
    [UIView setAnimationDidStopSelector:@selector(shopAction)];
    [UIView commitAnimations];
}
-(void)shopAction{
    NSLog(@"动画结束了哦");
}
@end
