//
//  AnimationShoppingTool.h
//  MyShoppingTest
//
//  Created by BlueDream on 2016/11/9.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@interface AnimationShoppingTool : NSObject<CAAnimationDelegate>


//做动画的按钮
@property (nonatomic, strong) UIButton  *animationButton;

//被抛的物体
@property (nonatomic, strong) UIView *showingView;

/**
 *  将某个view或者layer从起点抛到终点
 *  @param start  起点坐标
 *  @param end    终点坐标
 */
- (void)throwObject:(UIView *)obj animationButton:(UIButton *)button From:(CGPoint)start to:(CGPoint)end completionBlock:(void(^)())resultBlock;


+(AnimationShoppingTool *)sharedAnimation;



@end










