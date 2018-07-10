//
//  LikeBtnController.m
//  ObjectTest
//
//  Created by bing on 2018/7/3.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "LikeBtnController.h"
#import "YPDouYinLikeAnimation.h"
@interface LikeBtnController ()

@end

@implementation LikeBtnController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"点赞动画";
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
        [[YPDouYinLikeAnimation shareInstance] createAnimationWithTouch:touches withEvent:event];
}

@end
