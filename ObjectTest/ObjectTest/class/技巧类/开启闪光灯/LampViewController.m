//
//  LampViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/11/16.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "LampViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "Masonry.h"
@interface LampViewController ()
@property(nonatomic,strong)UIImageView*imageView;
@end

@implementation LampViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 160, [UIScreen mainScreen].bounds.size.width - 40, 30);
    
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(turnOn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:self.view.bounds ];
//    self.imageView.image = [UIImage imageNamed:@"1"];
    self.imageView.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.imageView];
    UIButton * btn  = [[UIButton alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnFun) forControlEvents:UIControlEventTouchDown];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UIView *viewBack=[UIView new];
    viewBack.backgroundColor=[UIColor redColor];
    [self.view addSubview:viewBack];
    [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    UITapGestureRecognizer *tapCoverView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapReadView:)];
    [viewBack addGestureRecognizer:tapCoverView];
    
    UIView *viewGreen=[UIView new];
    viewGreen.backgroundColor=[UIColor greenColor];
    [viewBack addSubview:viewGreen];
    [viewGreen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.mas_equalTo(viewBack).offset(0);
        make.height.mas_equalTo(viewBack.mas_height).multipliedBy(.5);
    }];
    UITapGestureRecognizer *tapCoverView1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapReadView:)];
    [viewGreen addGestureRecognizer:tapCoverView1];
    
    
    
    
}
- (void)handleTapReadView:(UITapGestureRecognizer *)tap{
    NSLog(@"点击了啊");
}
-(void)btnFun{
    CATransition * ca = [CATransition animation];
    ca.type = @"rippleEffect";
    ca.duration = 3;
    [self.view.layer addAnimation:ca forKey:@"ca"];
//    self.imageView.image = [UIImage imageNamed:@"2"];
    self.imageView.backgroundColor=[UIColor greenColor];
    
    
    
    

}


//开启闪光灯
-(void)turnOn:(UIButton *)sender{
    
    UIButton *but = sender;
    
    but.selected = !but.selected;
    if (but.selected) {
        [self turnonLed];
    }
    else{
        [self turnoffLed];
        
    }
}

//开启闪光灯
-(void)turnonLed{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSLog(@"%d",[device hasTorch]);
    //摄像头是否有提供闪光灯[device hasTorch]
    if ([device hasTorch]) {
        
        [device lockForConfiguration:nil];
        //开启闪光灯的代码
        [device setTorchMode: AVCaptureTorchModeOn];
        
        [device unlockForConfiguration];
        
    }
    
}
//关闭闪光灯
-(void)turnoffLed{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([device hasTorch]) {
        
        [device lockForConfiguration:nil];
        
        [device setTorchMode: AVCaptureTorchModeOff];
        
        [device unlockForConfiguration];
        
    }
    
}

@end
