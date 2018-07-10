//
//  GoodsImageBroseVC.m
//  doucui
//
//  Created by 吴振松 on 16/10/12.
//  Copyright © 2016年 lootai. All rights reserved.
//

typedef enum {
    NavigationBarItemTypeBack,
    NavigationBarItemTypeLeft,
    NavigationBarItemTypeRight,
} NavigationBarItemType;

#import "WSPhotosBroseVC.h"

@implementation WSPhotosBroseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)initializeView {
    [super initializeView];
    
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navView.backgroundColor=RGB(210, 41, 122);
    [self.view addSubview:navView];
    
    UIButton *leftNavBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //leftNavBtn.backgroundColor=[UIColor purpleColor];
    [leftNavBtn setTitle:@"返回" forState:UIControlStateNormal];
    leftNavBtn.frame=CGRectMake(10, 27, 50, 30);
    [leftNavBtn addTarget:self action:@selector(onClickBack) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:leftNavBtn];
    
    UIButton *rightNavBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //rightNavBtn.backgroundColor=[UIColor purpleColor];
    rightNavBtn.frame=CGRectMake( self.view.frame.size.width-60, 27, 50, 30);
        [rightNavBtn addTarget:self action:@selector(onClickDel) forControlEvents:UIControlEventTouchUpInside];
        [rightNavBtn setTitle:@"删除" forState:UIControlStateNormal];
    [navView addSubview:rightNavBtn];
    //[self setBarButtonWithText:@"删除" target:self action:@selector(onClickDel) type:NavigationBarItemTypeRight];
    //[self setBarButtonWithText:@"返回" target:self action:@selector(onClickBack) type:NavigationBarItemTypeLeft];
}

-(UIBarButtonItem *)setBarButtonWithText:(NSString*)text
                                  target:(id)target
                                  action:(SEL)action
                                    type:(NavigationBarItemType)type
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [button setTitle:text forState:UIControlStateNormal];
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -8;
    
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    if (type == NavigationBarItemTypeLeft) {
        self.navigationItem.leftBarButtonItems = @[space,buttonItem];
    }
    else if(type == NavigationBarItemTypeRight) {
        self.navigationItem.rightBarButtonItems = @[space,buttonItem];
    }
    else {
        self.navigationItem.backBarButtonItem = buttonItem;
    }
    
    return buttonItem;
}


- (void)onClickDel {
    if(self.showIndex >= 0 && self.showIndex < self.imageArray.count) {
        [self.imageArray removeObjectAtIndex:self.showIndex];
        [self.collectionView reloadData];
    }
    [self refreshTitle];
    if(self.imageArray.count == 0) {
        [self onClickBack];
    }
}

- (void)onClickBack {
    if(self.completion) {
        NSMutableArray *array = [NSMutableArray new];
        for (WSImageModel *model in self.imageArray) {
            [array addObject:model.image];
        }
        self.completion(array);
    }
   // [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
