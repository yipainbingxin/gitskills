//
//  AnimateController.m
//  ObjectTest
//
//  Created by bing on 2018/6/27.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "AnimateController.h"

@interface AnimateController ()
@property(nonatomic,strong)UIView *layerView;
@property(nonatomic,strong)CALayer *blueLayer;
@end

@implementation AnimateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"动画效果";
    self.layerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.layerView.center=self.view.center;
    self.layerView.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.layerView];
    
    /* A string defining how the contents of the layer is mapped into its
     * bounds rect. Options are `center', `top', `bottom', `left',
     * `right', `topLeft', `topRight', `bottomLeft', `bottomRight',
     * `resize', `resizeAspect', `resizeAspectFill'. The default value is
     * `resize'. Note that "bottom" always means "Minimum Y" and "top"
     * always means "Maximum Y". */
    
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    blueLayer.contentsGravity=@"resizeAspect";
//    UIImage *image=[UIImage imageNamed:@"3.jpg"];
//    blueLayer.contentsScale=[UIScreen mainScreen].scale;
//    blueLayer.masksToBounds=YES;
//    blueLayer.contents=(__bridge id _Nullable)(image.CGImage);
//    blueLayer.bounds=CGRectMake(0, 0, 50, 50);
//    blueLayer.position=CGPointMake(25, 25);
//    blueLayer.anchorPoint=CGPointMake(0.5, 0.5);
//    [self.layerView.layer addSublayer:blueLayer];
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it to our view
    [self.layerView.layer addSublayer:self.blueLayer];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //get touch position relative to main view
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //convert point to the white layer's coordinates
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    //get layer using containsPoint:
    if ([self.layerView.layer containsPoint:point]) {
        //convert point to blueLayer’s coordinates
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        if ([self.blueLayer containsPoint:point]) {
            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        } else {
            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
    }
}


@end
