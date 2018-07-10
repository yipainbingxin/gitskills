//
//  BlantViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/10.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "BlantViewController.h"
#import "UIView+EaseBlankPage.h"
#import "LSEditCommentView.h"
#import "KeyboardAvoiding.h"
@interface BlantViewController ()
@property(nonatomic,strong)LSEditCommentView *commentView;

@end

@implementation BlantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor=[UIColor whiteColor];
    //EaseBlankPageTypeView = 0,
    //EaseBlankPageTypeProject,
    //EaseBlankPageTypeNoButton,
    //EaseBlankPageTypeMaterialScheduling
    
    //self.dataArray=@[@"12"];
    //增加无数据展现
    
//    [self.view configBlankPage:EaseBlankPageTypeNoButton hasData:self.dataArray.count hasError:(self.dataArray.count>0) reloadButtonBlock:^(id sender) {
//
//    }];
    
    //失败时
//    [self.view configBlankPage:EaseBlankPageTypeView hasData:(self.dataArray.count>0) hasError:YES reloadButtonBlock:^(id sender) {
//            
//        }];
    
    _commentView = [LSEditCommentView new];
//    _commentView.delegate = self;
    [_commentView showCommentView:self.view];
    [KeyboardAvoiding setAvoidingView:_commentView withTarget:_commentView.textView];
    

    
    
    
}



@end
