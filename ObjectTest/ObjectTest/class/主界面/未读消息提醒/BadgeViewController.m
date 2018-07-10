//
//  BadgeViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/22.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "BadgeViewController.h"
#import "UIBarButtonItem+Badge.h"

@interface BadgeViewController ()

@end

@implementation BadgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton* msgBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    msgBtn.frame=CGRectMake(0, 0, 25, 25);
    [msgBtn setBackgroundImage:[UIImage imageNamed:@"icon_message"] forState:UIControlStateNormal];
    
    UIBarButtonItem* msgItBtn=[[UIBarButtonItem alloc]initWithCustomView:msgBtn];
    
    self.navigationItem.rightBarButtonItem = msgItBtn;
    self.navigationItem.rightBarButtonItem.badgeBGColor=[UIColor redColor];
    self.navigationItem.rightBarButtonItem.badgeValue=@"8";
    [msgBtn addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchDown];
    

}
#pragma mark - Private
-(void)buttonPress:(id)sender
{
    self.navigationItem.rightBarButtonItem.badgeValue = @"";
    //   方法调用直接清楚角标
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
