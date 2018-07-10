//
//  ShoppingViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/11/9.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "ShoppingViewController.h"

@interface ShoppingViewController ()<CAAnimationDelegate>


{
    UIButton *button2;
}
@property (nonatomic,strong) CALayer *layer;

@property (nonatomic,strong) UIBezierPath *path;

@property (nonatomic,strong) CALayer *dotLayer;

@property (nonatomic,assign) CGFloat endPointX;

@property (nonatomic,assign) CGFloat endPointY;


@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(300, 50, 30, 30);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame=CGRectMake(60, 380, 40, 40);
    button2.backgroundColor=[UIColor redColor];
    [self.view addSubview:button2];

    CGRect  endRect=[self.view convertRect:button2.frame toView:self.view];
    
    _endPointX = endRect.origin.x;
    _endPointY = endRect.origin.y;
    
    
}


-(void)btnClick:(UIButton *)btn{
    
    CGRect parentRect = [self.view convertRect:btn.frame toView:self.view];
    
    [self JoinCartAnimationWithRect:parentRect];
    
    
}

#pragma mark -加入购物车动画
-(void) JoinCartAnimationWithRect:(CGRect)rect
{
    
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    
    _path= [UIBezierPath bezierPath];
    [_path moveToPoint:CGPointMake(startX, startY)];
    //三点曲线
    [_path addCurveToPoint:CGPointMake(60,380)
             controlPoint1:CGPointMake(startX, startY)
             controlPoint2:CGPointMake(startX - 100, startY - 100)];
    
    _dotLayer = [CALayer layer];
    _dotLayer.backgroundColor = [UIColor redColor].CGColor;
    _dotLayer.frame = CGRectMake(0, 0, 15, 15);
    _dotLayer.cornerRadius = (15 + 15) /4;
    [self.view.layer addSublayer:_dotLayer];
    [self groupAnimation];
    
}
#pragma mark - 组合动画
-(void)groupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.5f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.8f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [_dotLayer addAnimation:groups forKey:nil];
    
    [self performSelector:@selector(removeFromLayer:) withObject:_dotLayer afterDelay:0.8f];
    
}
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if ([[anim valueForKey:@"animationName"]isEqualToString:@"groupsAnimation"]) {
        
        CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        shakeAnimation.duration = 0.25f;
        shakeAnimation.fromValue = [NSNumber numberWithFloat:0.9];
        shakeAnimation.toValue = [NSNumber numberWithFloat:1];
        shakeAnimation.autoreverses = YES;
        [button2.layer addAnimation:shakeAnimation forKey:nil];
    }
    
}


@end
