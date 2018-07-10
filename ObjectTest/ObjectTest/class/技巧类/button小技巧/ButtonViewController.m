//
//  ViewController.m
//  MyButton
//
//  Created by BlueDream on 2016/10/13.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()
{
    int index;
    
}
@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view,
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self creatUI2];
    [self creatUI1];
    

}

-(void)creatUI2{
 
    index=0;
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 40)];
    [button setTitle:@"默认" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}




-(void)creatUI1{
    
    _selectedBtn = nil;
    NSArray * array = [NSArray arrayWithObjects:@"默认",@"销量",@"价格",@"时间", nil];
    for (int i = 0; i<4; i ++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 100, 80, 40)];
        [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        button.tag=i;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        if (i==0) {
            button.selected=YES;
            _selectedBtn=button;
        }
        
    }
    
    
}
    
    
-(void)buttonSelected:(UIButton*)sender{
    
//    if (sender!= self.selectedBtn) {
//        self.selectedBtn.selected = NO;
//        sender.selected = YES;
//        self.selectedBtn = sender;
//    }else{
//        self.selectedBtn.selected = YES;
//    }
    
    _selectedBtn.selected=NO;
    sender.selected=YES;
    _selectedBtn=sender;
    
    
}


-(void)buttonClick:(UIButton *)btn{
    
    NSArray * array = [NSArray arrayWithObjects:@"默认",@"销量",@"价格",@"时间", nil];
    index++;
    [btn setTitle:[array objectAtIndex:index] forState:UIControlStateNormal];
    if (index==array.count-1) {
        
        index=-1;
        
    }
    
}






@end
