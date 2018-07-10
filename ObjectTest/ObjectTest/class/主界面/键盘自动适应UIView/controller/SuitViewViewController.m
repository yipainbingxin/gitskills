//
//  SuitViewViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/10.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "SuitViewViewController.h"
#import "KeyboardAvoiding.h"

@interface SuitViewViewController ()

@end

@implementation SuitViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(20, self.view.bounds.size.height-100, self.view.bounds.size.width-40, 60)];
    bgView.backgroundColor=[UIColor purpleColor];
    [self.view addSubview:bgView];
    
    UITextField *textField=[[UITextField alloc]initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-40, 30)];
    textField.placeholder=@"1111111111111111";
    [bgView addSubview:textField];
    
    
    //设置键盘不遮挡自定义的uiview,意思是避免自定义uiview在self.view上出现遮挡
    
    [KeyboardAvoiding setAvoidingView:self.view withTarget:bgView];
}


@end
