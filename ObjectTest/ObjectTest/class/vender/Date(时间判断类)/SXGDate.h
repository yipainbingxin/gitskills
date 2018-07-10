//
//  SXGDate.h
//  Date
//
//  Created by BlueDream on 2016/10/20.
//  Copyright © 2016年 BlueDream. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXGDate : NSObject

//获得当前的时间
+(NSString *)getNowDate;

//获得年月日时分秒
+(NSString *)getCustomDate;

//判断当前时间是否在某个时间段内
+(BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;

//比较某个时间与当前时间间隔的天数
+(NSString *)compareTime:(NSString *)beginTime;



@end
