//
//  SXGDate.m
//  Date
//
//  Created by BlueDream on 2016/10/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import "SXGDate.h"

@implementation SXGDate




//获得当前的时间
+(NSString *)getNowDate{
    
    NSDate *currentDate = [NSDate date];//获取当前时间，日期
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

//获得年月日时分秒
+(NSString *)getCustomDate
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags =NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    NSInteger year = [dateComponent year];
    NSInteger month = [dateComponent month];
    NSInteger day = [dateComponent day];
    NSInteger hour = [dateComponent hour];
    NSInteger minute = [dateComponent minute];
    NSInteger second = [dateComponent second];
    
    
    NSString *Time=[NSString stringWithFormat:@"%ld-%ld-%ld-%ld-%ld-%ld",(long)year,(long)month,(long)day,(long)hour,(long)minute,(long)second];
    
    return Time;
    
}




//判断时间是否在某个时间段内
+(BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *dateFromHour = [self getCustomDateWithHour:fromHour];
    NSDate *dateToHour = [self getCustomDateWithHour:toHour];
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:dateFromHour]==NSOrderedDescending && [currentDate compare:dateToHour]==NSOrderedAscending)
    {
        //NSLog(@"该时间在 %ld:00-%ld:00 之间！", (long)fromHour, (long)toHour);
        return YES;
    }
    return NO;
}

+(NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 生成当天的component
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    
    // 根据resultCalendar和resultComps生成日期
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}
#pragma mark 比较时间的方法
+(NSString *)compareTime:(NSString *)beginTime{
    
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *fromDate;
    NSDate *toDate;
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&fromDate interval:NULL forDate:[dateFormatter dateFromString:beginTime]];
    [gregorian rangeOfUnit:NSCalendarUnitDay startDate:&toDate interval:NULL forDate:[NSDate date]];
    // dayComponents.day  即为间隔的天数
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    //间隔的天数
    NSString *timeDay=[NSString stringWithFormat:@"%ld",(long)dayComponents.day];
    
    return timeDay;
    
    
}

@end
