//
//  DateViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/10/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "DateViewController.h"
#import "SXGDate.h"

@interface DateViewController ()

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    //获得当前的时间
    NSLog(@"当前的时间为:----%@",[SXGDate getNowDate]);
    //获得年月日时分秒
    NSLog(@"获得年月日时分秒为:----%@",[SXGDate getCustomDate]);

    //判断当前时间是否在某个时间段内
    if ([SXGDate isBetweenFromHour:9 toHour:16]==1) {
        
        NSLog(@"----------在");
        
    }else{
        NSLog(@"----------不在");
    }

    //比较某个时间与当前时间间隔的天数
    NSLog(@"时间间隔为----%@",[SXGDate compareTime:@"2016-10-19 14:47:19"]) ;
    
    
    
    
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
