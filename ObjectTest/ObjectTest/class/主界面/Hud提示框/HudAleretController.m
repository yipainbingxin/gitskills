//
//  HudAleretController.m
//  ObjectTest
//
//  Created by bing on 2018/7/4.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "HudAleretController.h"
#import "MBProgressHUD+DZM.h"
@interface HudAleretController ()
@property(nonatomic,strong)UIButton *btnPro1;
@property(nonatomic,strong)UIButton *btnPro2;
@property(nonatomic,strong)UIButton *btnPro3;

@end
@implementation HudAleretController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"hud提示框";
    _btnPro1=[UIButton buttonWithType:UIButtonTypeSystem];
    _btnPro1.frame=CGRectMake(100, 64, 100, 50);
    _btnPro1.tag=1;
    _btnPro1.backgroundColor=[UIColor redColor];
    [_btnPro1 addTarget:self action:@selector(btnPro1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnPro1];
    
    
    _btnPro2=[UIButton buttonWithType:UIButtonTypeSystem];
    _btnPro2.frame=CGRectMake(CGRectGetMaxX(_btnPro1.frame)+20, 64, 100, 50);
    _btnPro2.tag=2;
    _btnPro2.backgroundColor=[UIColor orangeColor];
    [_btnPro2 addTarget:self action:@selector(btnPro1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnPro2];
    
    
    _btnPro3=[UIButton buttonWithType:UIButtonTypeSystem];
    _btnPro3.frame=CGRectMake(CGRectGetMaxX(_btnPro2.frame)+20, 64, 100, 50);
    _btnPro3.tag=3;
    _btnPro3.backgroundColor=[UIColor orangeColor];
    [_btnPro3 addTarget:self action:@selector(btnPro1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnPro3];
}
-(void)btnPro1Click:(UIButton*)btn{
    if (btn.tag==1) {
        [MBProgressHUD showMessage:@"点击我就对了"];
    }else if (btn.tag==2){
        [MBProgressHUD showError:@"崩溃啦"];
    }else if (btn.tag==3){
        [MBProgressHUD showSuccess:@"ok"];
    }
    
}

@end
