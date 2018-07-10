//
//  TimeController.m
//  ObjectTest
//
//  Created by bing on 2018/3/23.
//  Copyright © 2018年 BlueDream. All rights reserved.
//

#import "TimeController.h"
#import "CountDown.h"
@interface TimeController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)CountDown *countDown;
@property(nonatomic,strong)UITableView *table;

@property(nonatomic,strong) NSMutableArray*dataSource;
@end

@implementation TimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.view addSubview:self.table];
    [_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CountDownCell"];
    _table.rowHeight = 100;//固定行高最好用这个属性，提高效率，不用走代理方法询问每个row多高
    
    
//    self.dataSource=[[NSMutableArray alloc]initWithObjects:@"51454",@"51454",@"51454", nil];
    
    self.dataSource=[[NSMutableArray alloc]initWithObjects:@"2018-03-24 00:25:16",@"2018-03-24 00:25:16",@"2018-03-24 00:25:16", nil];
    self.countDown = [[CountDown alloc] init];
    __weak __typeof(self) weakSelf= self;
    ///每秒回调一次
    [self.countDown countDownWithPER_SECBlock:^{
        NSLog(@"6");
        [weakSelf updateTimeInVisibleCells];
    }];

}
-(void)updateTimeInVisibleCells{
    NSArray  *cells = self.table.visibleCells; //取出屏幕可见ceLl
    for (UITableViewCell *cell in cells) {
        NSString *time =self.dataSource[cell.tag];
//        NSString *str =  [self bySecondGetDate:time];
//        cell.textLabel.text = [self getNowTimeWithString:str];
        cell.textLabel.text = [self getNowTimeWithString:time];
    }

    
}
- (NSString *)bySecondGetDate:(NSString *)second{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateLoca = [NSString stringWithFormat:@"%@",second];
    NSTimeInterval time=[dateLoca doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSinceNow:time];
    NSString *timestr = [formatter stringFromDate:detaildate];
    
    return timestr;
}

-(NSString *)getNowTimeWithString:(NSString *)aTimeString{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    hoursStr = [NSString stringWithFormat:@"%d",hours];
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0) {
        return @"活动已经结束！";
    }
    if (days) {
        return [NSString stringWithFormat:@"%@天 %@小时 %@分 %@秒", dayStr,hoursStr, minutesStr,secondsStr];
    }
    return [NSString stringWithFormat:@"%@小时 %@分 %@秒",hoursStr , minutesStr,secondsStr];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountDownCell"];
//    NSString *time = [self bySecondGetDate:self.dataSource[indexPath.row]];
//    cell.textLabel.text = [self getNowTimeWithString:time];
//
    cell.textLabel.text = [self getNowTimeWithString:self.dataSource[indexPath.row]];
    cell.tag = indexPath.row;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)dealloc{
    NSLog(@"%s dealloc",object_getClassName(self));
}



@end
