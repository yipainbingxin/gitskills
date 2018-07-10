//
//  MainViewController.m
//  ObjectTest
//
//  Created by BlueDream on 16/8/19.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "MainViewController.h"
#import "FaloutViewController.h"
#import "TitleScrViewController.h"
#import "BlantViewController.h"
#import "SuitViewViewController.h"
#import "CarouselViewController.h"
#import "MarqueeLabelController.h"
#import "LineLayoutController.h"
#import "StringViewController.h"
#import "HUDViewController.h"
#import "PickerViewController.h"
#import "BadgeViewController.h"
#import "BDViewController.h"
#import "NJDTestViewController.h"
#import "NineViewController.h"
#import "KeyboardViewController.h"
#import "AlertPickerViewController.h"
#import "DateViewController.h"
#import "UpViewController.h"
#import "TaoBaoViewController.h"
#import "MulChooseViewController.h"
#import "TimeController.h"
#import "ImagePicViewController.h"
#import "LikeBtnController.h"
//#import "NetAndHudController.h"
#import "HudAleretController.h"
#import "AnimateVC.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

{
   
    NSArray *_titleArray;//存储标题的数组
    
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"好的第三方集合";
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    _titleArray=@[@"自定义瀑布流1",@"顶部滑动最全2",@"空白页提示3",@"键盘自动适应UIView4",@"最全的图片轮播5",@"跑马灯6",@"相片横向滑动7",@"超级富文本8",@"HUD提示框9",@"HUD提示框10",@"提示框和请求的封装11",@"省市区三级联动12",@"未读消息提醒13",@"JSWave(头部波浪)14",@"仿余额宝数字渐慢跳动效果15",@"九宫格抽奖16",@"实际的网络状态17",@"键盘遮挡处理18",@"弹框和三级联动集合19",@"时间之间的判断20",@"上下轮播21",@"加入购物车动画22",@"单元格的单选和多选23",@"倒计时24",@"多选图片库25",@"点赞动画26",@"动画学习27"];
    tableView.tableFooterView = [[UIView alloc] init];
    
    
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
    
    switch (indexPath.row) {
        case 0:
        {
            FaloutViewController *vc=[[FaloutViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            TitleScrViewController *vc=[[TitleScrViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            BlantViewController *vc=[[BlantViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            SuitViewViewController *vc=[[SuitViewViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 4:
        {
            CarouselViewController *vc=[[CarouselViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            MarqueeLabelController *vc=[[MarqueeLabelController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            LineLayoutController *vc=[[LineLayoutController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            StringViewController *vc=[[StringViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 8:
        {
            HUDViewController *vc=[[HUDViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 9:
        {
            HudAleretController *vc=[[HudAleretController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;


        case 11:
        {
            PickerViewController *vc=[[PickerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 12:
        {
            BadgeViewController *vc=[[BadgeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 13:
        {
            BDViewController *vc=[[BDViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 14:
        {
            NJDTestViewController *vc=[[NJDTestViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 15:
        {
             NineViewController *vc=[[NineViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 16:
        {
           
        }
            break;

        case 17:
        {
            KeyboardViewController *vc=[[KeyboardViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 18:
        {
            AlertPickerViewController *vc=[[AlertPickerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 19:
        {
            DateViewController *vc=[[DateViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 20:
        {
            UpViewController *vc=[[UpViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 21:
        {
            TaoBaoViewController *vc=[[TaoBaoViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 22:
        {
            MulChooseViewController *vc=[[MulChooseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 23:
        {
            TimeController *vc=[[TimeController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 24:
        {
            ImagePicViewController *vc=[[ImagePicViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 25:
        {
            LikeBtnController *vc=[[LikeBtnController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 26:
        {
            AnimateVC *vc=[[AnimateVC alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    
     
    
}



@end
