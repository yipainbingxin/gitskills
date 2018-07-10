//
//  AnimationShoppingTool.m
//  MyShoppingTest
//
//  Created by BlueDream on 2016/11/9.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "AnimationShoppingTool.h"



static AnimationShoppingTool *animationTool=nil;


@implementation AnimationShoppingTool



+(AnimationShoppingTool *)sharedAnimation{
    
    if (!animationTool) {
        
        animationTool=[[AnimationShoppingTool alloc]init];
    }
    
    return animationTool;
    
    
}




/**
 *  将某个view或者layer从起点抛到终点
 *  @param start  起点坐标
 *  @param end    终点坐标
 */
- (void)throwObject:(UIView *)obj animationButton:(UIButton *)button From:(CGPoint)start to:(CGPoint)end completionBlock:(void(^)())resultBlock
{
    
    self.showingView=obj;
    self.animationButton=button;
    resultBlock();
    
    
    UIBezierPath *path= [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(start.x, start.y)];
    //三点曲线
    [path addCurveToPoint:CGPointMake(end.x+25, end.y+25)
            controlPoint1:CGPointMake(start.x, start.y)
            controlPoint2:CGPointMake(start.x - 180, start.y - 200)];
    
    [self groupAnimation:path];
}


#pragma mark - 组合动画
-(void)groupAnimation:(UIBezierPath *)path
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.8f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.5f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [self.showingView.layer addAnimation:groups forKey:@"position scale"];
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    if ([[anim valueForKey:@"animationName"]isEqualToString:@"groupsAnimation"]){
        
    CABasicAnimation *shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shakeAnimation.duration = 0.25f;
    shakeAnimation.fromValue = [NSNumber numberWithFloat:0.9];
    shakeAnimation.toValue = [NSNumber numberWithFloat:1];
    shakeAnimation.autoreverses = YES;
    [self.animationButton.layer addAnimation:shakeAnimation forKey:nil];
}
}


@end
