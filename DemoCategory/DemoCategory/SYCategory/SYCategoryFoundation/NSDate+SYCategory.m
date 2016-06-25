//
//  NSDate+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSDate+SYCategory.h"

@implementation NSDate (SYCategory)

/**
 *  获取指定时间时间，并根据指定格式显示
 *
 *  @param format 时间显示格式
 *
 *  @return 指定显示格式时间
 */
- (NSString *)timeDateWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = format;
    NSString *result = [dateFormater stringFromDate:self];
    return result;
}

/**
 *  计算两个日期距离现在多久
 *
 *  @param lastTime      上次日期
 *  @param lastFormat    上次日期格式
 *  @param currentTime   最近日期
 *  @param currentFormat 最近日期格式
 *
 *  @return 日期距离
 */
+ (NSString *)timeDateWithLastTime:(NSString *)lastTime lastTimeFormat:(NSString *)lastFormat currentTime:(NSString *)currentTime currentTimeFormat:(NSString *)currentFormat
{
    // 上次时间
    NSDateFormatter *dateFormatLast = [[NSDateFormatter alloc] init];
    dateFormatLast.dateFormat = lastFormat;
    NSDate *dateLast = [dateFormatLast dateFromString:lastTime];
    
    // 当前时间
    NSDateFormatter *dateFormatNow = [[NSDateFormatter alloc] init];
    dateFormatNow.dateFormat = currentFormat;
    NSDate *dateNow = [dateFormatNow dateFromString:currentTime];
    
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    // 上次时间
    NSDate *lastDate = [dateLast dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:dateLast]];
    // 当前时间
    NSDate *nowDate = [dateNow dateByAddingTimeInterval:[timeZone secondsFromGMTForDate:dateNow]];
    // 时间间距
    NSInteger intervalTime = [nowDate timeIntervalSinceReferenceDate] - [lastDate timeIntervalSinceReferenceDate];
    // 秒、分、小时、天、月、年
    NSInteger minutes = intervalTime / 60;
    NSInteger hours = intervalTime / 60 / 60;
    NSInteger day = intervalTime / 60 / 60 / 24;
    NSInteger month = intervalTime / 60 / 60 / 24 / 30;
    NSInteger years = intervalTime / 60 / 60 / 24 / 365;
    
    NSString *resutl = nil;
    if (minutes < 10)
    {
        resutl = @"刚刚";
    }
    else if (minutes < 60)
    {
        resutl = [NSString stringWithFormat:@"%@分钟前", @(minutes)];
    }
    else if (hours < 24)
    {
        resutl = [NSString stringWithFormat:@"%@小时前", @(hours)];
    }
    else if (day < 30)
    {
        resutl = [NSString stringWithFormat:@"%@天前", @(day)];
    }
    else if (month < 12)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"M月d日";
        resutl = [dateFormatter stringFromDate:lastDate];
    }
    else if (years >=1)
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy年M月d日";
        resutl = [dateFormatter stringFromDate:lastDate];
    }
    
    return resutl;
}


@end
