//
//  PickerViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "PickerViewController.h"
#import "STPickerArea.h"

@interface PickerViewController ()<STPickerAreaDelegate>
{
    UILabel *_label;
}
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    _label.center=self.view.center;
    _label.backgroundColor=[UIColor blueColor];
    _label.font=[UIFont fontWithName:@"PingFangTC-Medium" size:20];
    [self.view addSubview:_label];

    
    //使用方法
    STPickerArea *pickerArea = [[STPickerArea alloc]init];
    [pickerArea setDelegate:self];
    
    
    //STPickerContentModeBottom, // 1.选择器在视图的下方
    //STPickerContentModeCenter  // 2.选择器在视图的中间
    [pickerArea setContentMode:STPickerContentModeBottom];
    [pickerArea show];
    
}

#pragma mark-----STPickerAreaDelegate

- (void)pickerArea:(STPickerArea *)pickerArea province:(NSString *)province city:(NSString *)city area:(NSString *)area
{
    NSString *text = [NSString stringWithFormat:@"%@ %@ %@", province, city, area];
    
    _label.text=text;
    
}



@end
