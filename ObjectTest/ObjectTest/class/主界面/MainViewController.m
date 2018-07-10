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
    _titleArray=@[@"自定义瀑布流",@"顶部滑动最全",@"空白页提示",@"键盘自动适应UIView",@"最全的图片轮播",@"跑马灯",@"相片横向滑动",@"超级富文本",@"HUD提示框1",@"HUD提示框2",@"提示框和请求的封装",@"省市区三级联动",@"未读消息提醒",@"JSWave(头部波浪)",@"仿余额宝数字渐慢跳动效果",@"九宫格抽奖",@"实际的网络状态",@"键盘遮挡处理",@"弹框和三级联动集合",@"时间之间的判断",@"上下轮播",@"加入购物车动画",@"单元格的单选和多选",@"倒计时",@"多选图片库",@"点赞动画"];
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


        case 10:
        {
            PickerViewController *vc=[[PickerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 11:
        {
            BadgeViewController *vc=[[BadgeViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 12:
        {
            BDViewController *vc=[[BDViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 13:
        {
            NJDTestViewController *vc=[[NJDTestViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 14:
        {
             NineViewController *vc=[[NineViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 15:
        {
           
        }
            break;

        case 16:
        {
            KeyboardViewController *vc=[[KeyboardViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }

            break;
        case 17:
        {
            AlertPickerViewController *vc=[[AlertPickerViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 18:
        {
            DateViewController *vc=[[DateViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 19:
        {
            UpViewController *vc=[[UpViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 20:
        {
            TaoBaoViewController *vc=[[TaoBaoViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 21:
        {
            MulChooseViewController *vc=[[MulChooseViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 22:
        {
            TimeController *vc=[[TimeController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 23:
        {
            ImagePicViewController *vc=[[ImagePicViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 24:
        {
            LikeBtnController *vc=[[LikeBtnController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
    
     
    
}



@end
