//
//  TableViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/23.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    //都是针对tableView来看-----分割线全屏
    //1 去除掉自动布局添加的边距
    tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    //tableView.allowsSelection = NO;//设置单元格不可选
    //tableView.tableFooterView = [[UIView alloc] init];//消除不显示的分割线
    //tableView.separatorStyle=UITableViewCellSelectionStyleNone;//取消分割线显示
    //tableView.scrollEnabled=NO;//不许单元格滑动
    

    
    [self.view addSubview:tableView];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    //3 去掉cell的自动布局添加的边距
    cell.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textLabel.text=@"黑魔法";
    
    //设置点击单元格时没有弹跳效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"--------%ld",(long)indexPath.row);
    
}







@end
