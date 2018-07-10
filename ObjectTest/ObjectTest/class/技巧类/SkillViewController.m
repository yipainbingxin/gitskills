//
//  SkillViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/9/11.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "SkillViewController.h"
#import "PasswordViewController.h"
#import "SkillDetailController.h"
#import "SettingViewController.h"
#import "TextfieldViewController.h"
#import "DefineAndConstController.h"
#import "TableViewController.h"
#import "AutoLabelController.h"
#import "ButtonViewController.h"
#import "ShoppingViewController.h"
#import "XibViewController.h"
#import "LampViewController.h"
#import "SideSelectViewController.h"
#import "ZhifubaoViewController.h"
#import "CellViewController.h"
#import "PrizeButtonController.h"
#import "AnimateController.h"
@interface SkillViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    NSArray *_titleArray;//存储标题的数组
    
}

@end

@implementation SkillViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title =@"";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    self.navigationItem.title=@"技巧类demo";
    

    //设置导航栏
    [self setupNav];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-128) style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    //都是针对tableView来看
    //1 去除掉自动布局添加的边距
    tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    [self.view addSubview:tableView];
    _titleArray=@[@"代码技巧类",@"密码输入框",@"跳转系统设置",@"自定义textfield",@"宏和常量的正确使用",@"tableView的黑魔法",@"label的高度自适应",@"button小技巧",@"购物车动画",@"加载自定义xib",@"开启闪关灯",@"仿天猫超市侧边单选",@"支付宝支付成功信息处理",@"cell表格的嵌套",@"点赞",@"动画效果"];
    
}


#pragma mark-----去掉导航栏默认黑线。
//视图将要显示时隐藏
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

//视图将要消失时取消隐藏
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
#pragma mark-----设置导航栏
-(void)setupNav{
    
    //导航栏的标题
    self.navigationItem.title=@"技巧类demo";
    
    //修改导航栏标题为图片
    //self.navigationItem.titleView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lock"]];
    
    
    //调整导航栏背景色
    self.navigationController.navigationBar.barTintColor =[UIColor purpleColor];
    
    //半透明开关
    self.navigationController.navigationBar.translucent = NO;
    
    
    //修改导航栏标题的字体
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    //字典中放入你想修改的键值对,原来的UITextAttributeFont、UITextAttributeTextColor、UITextAttributeTextShadowColor、UITextAttributeTextShadowOffset已弃用
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0],NSShadowAttributeName:shadow, NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0]};
    
    
    //添加多个按钮
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc]initWithTitle:@"item1" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem* item2 = [[UIBarButtonItem alloc]initWithTitle:@"item2" style:UIBarButtonItemStylePlain target:nil action:nil];
    NSArray* array = @[item1,item2];
    
    self.navigationItem.leftBarButtonItems = array;
    
    self.navigationItem.rightBarButtonItems = array;
    //按钮字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor blueColor];
    
    
    //导航栏toolBar隐藏开关
    //self.navigationController.toolbarHidden = NO;
    
    //设置toolbarHidden隐藏和显示，两种方法均可
    self.navigationController.toolbarHidden=YES;
    //[self.navigationController setToolbarHidden:NO animated:YES];
    //设置toolbarHidden背景颜色
    [self.navigationController.toolbar setBarTintColor:[UIColor redColor]];
    //这个貌似没有用（设置背景的）
    //[self.navigationController.toolbar setBackgroundColor:[UIColor orangeColor]];
    //设置toolbarHidden样式，黑色，黑色透明等等，但貌似都是半透明效果
    [self.navigationController.toolbar setBarStyle:UIBarStyleBlack];
    //设置toolbarHidden背景图片，forToolbarPosition是位置状态是放在什么地方时显示设置它的位置，UIBarMetricsDefault是状态设置在竖屏还是横屏时显示
    [self.navigationController.toolbar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    //可以设置位置，但貌似无效果
    //self.navigationController.toolbar.frame=CGRectMake(0, 0, 375, 44);
    
    //重点是设置上面的按钮这些
    //和设置navigationBarItem类似
    //先设置一个UIBarButtonItem，然后组成数组，然后把这个数组赋值给self.toolbarItems
    
    UIBarButtonItem *btn1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    UIBarButtonItem *btn2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    UIBarButtonItem *btn3=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    UIBarButtonItem *btn4=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *btn5=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    
    NSArray *arr1=[[NSArray alloc]initWithObjects:btn1,btn4,btn2,btn4,btn3,btn4,btn5, nil];
    self.toolbarItems=arr1;
    
    
    
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
    
    if (indexPath.row==0) {
        
        cell.backgroundColor=[UIColor purpleColor];
        
    }

    //去掉cell的自动布局添加的边距
    cell.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.textLabel.text=_titleArray[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            SkillDetailController *vc=[[SkillDetailController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            PasswordViewController *vc=[[PasswordViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            SettingViewController *vc=[[SettingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
           
        }
            break;
        case 3:
        {
            TextfieldViewController *vc=[[TextfieldViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 4:
        {
            DefineAndConstController *vc=[[DefineAndConstController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 5:
        {
            TableViewController *vc=[[TableViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        case 6:
        {
            AutoLabelController *vc=[[AutoLabelController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 7:
        {
            ButtonViewController *vc=[[ButtonViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 8:
        {
            ShoppingViewController *vc=[[ShoppingViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 9:
        {
            XibViewController *vc=[[XibViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 10:
        {
            LampViewController *vc=[[LampViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 11:
        {
            SideSelectViewController *vc=[[SideSelectViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;

        case 12:
        {
            ZhifubaoViewController *vc=[[ZhifubaoViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 13:
        {
            CellViewController *vc=[[CellViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 14:
        {
            PrizeButtonController *vc=[[PrizeButtonController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 15:
        {
            AnimateController *vc=[[AnimateController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        
        default:
            break;
    }
    
    
    
}


@end
