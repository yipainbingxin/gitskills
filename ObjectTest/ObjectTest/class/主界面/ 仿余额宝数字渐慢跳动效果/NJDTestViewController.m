//
//  NJDTestViewController.m
//  BZNumberJumpDemo
//
//  Created by Bruce on 14-7-1.
//  Copyright (c) 2014年 com.Bruce.Number. All rights reserved.
//

#import "NJDTestViewController.h"

@interface NJDTestViewController ()
{
    CACustomTextLayer *_textLayer;
}


@end

@implementation NJDTestViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.

    
    /*
     Demo里的都是整数间的跳转，想弄成带小数的跳转，很简单，只要到CATextLayer+NumberJump.m文件 里
     
     changeNumberBySelector方法里修改成如下
     
    float value = [(NSNumber *)[pointValues objectAtIndex:1] floatValue];就OK
     
     */
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    _textLayer = [[CACustomTextLayer alloc] init];
    _textLayer.string = @"0";
    _textLayer.frame = CGRectMake(10, 80, 300, 100);
    _textLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [_textLayer jumpNumberWithDuration:5 fromNumber:0 toNumber:1000.00];
    [self.view.layer addSublayer:_textLayer];

 
    }


@end
