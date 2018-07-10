//
//  AutoLabelController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/27.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "AutoLabelController.h"

@interface AutoLabelController ()

@end

@implementation AutoLabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UILabel *label=[[UILabel alloc]init];
    NSString *string=@"中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------中华人民共和国中央人民政府-------";
    label.text = string;
    label.numberOfLines=0;
    label.font=[UIFont systemFontOfSize:19];
    label.backgroundColor=[UIColor redColor];
    CGRect rect=[string boundingRectWithSize:CGSizeMake(self.view.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:19]} context:nil];
    label.frame=CGRectMake(0, 100, rect.size.width, rect.size.height);
    [self.view addSubview:label];
    
    
    
    
    
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
