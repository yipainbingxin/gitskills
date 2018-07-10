//
//  TaoBaoViewController.m
//  ObjectTest
//
//  Created by BlueDream on 2016/12/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "TaoBaoViewController.h"
#import "AnimationShoppingTool.h"

@interface TaoBaoViewController ()
{
    UIButton *button;
    UIButton *button2;
}
@property (nonatomic,strong) UIView *dotLayer;

@end

@implementation TaoBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(300, 100, 30, 30);
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame=CGRectMake(60, 380, 40, 40);
    button2.backgroundColor=[UIColor redColor];
    [self.view addSubview:button2];
    
    
    _dotLayer = [UIView new];
    _dotLayer.backgroundColor = [UIColor redColor];
    _dotLayer.frame = CGRectMake(0, 0, 15, 15);
    [self.view addSubview:_dotLayer];
    
}

-(void)btnClick{
    
    //通过坐标转换得到抛物线的起点和终点
    CGRect parentRectA = [self.view convertRect:button.frame toView:self.view];
    CGRect parentRectB = [self.view convertRect:button2.frame toView:self.view];
    
    [[AnimationShoppingTool sharedAnimation]throwObject:_dotLayer animationButton:button2 From:parentRectA.origin to:parentRectB.origin completionBlock:^{
        
        
        NSLog(@"---------");
    }];
    
    
    
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
