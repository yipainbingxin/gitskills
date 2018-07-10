//
//  MyUIViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "MyUIViewController.h"
#import "DetailUIViewController.h"

@interface MyUIViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSArray *_titleArray;//存储标题的数组
    
}


@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"我的UI控件";
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    _titleArray=@[@"(CoreText框架)NSAttributedString",@"苹果API常用英语名词",@"文本属性Attributes",@"UIActivityIndicatorView",@"UIAlertView",@"UIButton属性",@"UIControl事件",@"UIDatePicker",@"UIImagePickerController",@"UIImageView属性",@"UIKit结构图",@"UILabel属性",@"UIPageControl",@"UIPikerView的属性",@"UIScrollView",@"UISegment属性",@"UISlide属性",@"UISwitch属性",@"UITableView",@"UITextField属性",@"UITextView",@"UIView属性"];
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _titleArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    
    cell.textLabel.text=_titleArray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailUIViewController *vc=[[DetailUIViewController alloc]init];
    vc.sourceString=_titleArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
        
}

@end
