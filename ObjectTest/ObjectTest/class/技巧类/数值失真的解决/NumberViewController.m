//
//  NumberViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/12/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "NumberViewController.h"

@interface NumberViewController ()

@end

@implementation NumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //设置数值只取得两位小数,不四舍五入-----1
    float a=  floor(0.900*100) / 100;
    
    NSLog(@"---------%.2f",a);

     //设置数值只取得两位小数,不四舍五入-----2
    NSNumber *number = @(0.900);
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingMode = NSNumberFormatterRoundFloor;
    formatter.maximumFractionDigits = 2;
    NSLog(@"%@", [formatter stringFromNumber:number]); // 99.99 float num = 99.999;
    NSLog(@"%@", number); // --100.00
    
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
