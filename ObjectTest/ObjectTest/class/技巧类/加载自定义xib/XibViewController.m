//
//  XibViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/11/16.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "XibViewController.h"
#import "myView.h"

@interface XibViewController ()

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"myView" owner:self options:nil];
    UIView *tmpCustomView = [nib objectAtIndex:0];
    tmpCustomView.frame=CGRectMake(0, 100, self.view.frame.size.width, 100);
    
    [self.view addSubview:tmpCustomView];

    
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
