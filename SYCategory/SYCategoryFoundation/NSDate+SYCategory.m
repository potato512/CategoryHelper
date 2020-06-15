//
//  NSDate+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSDate+SYCategory.h"
#import <objc/runtime.h>

@interface NSDate ()

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation NSDate (SYCategory)

/****************************************************************/

#pragma mark - setter/getter

- (void)setDateFormatter:(NSDateFormatter *)dateFormatter
{
    objc_setAssociatedObject(self, @selector(dateFormatter), dateFormatter, OBJC_ASSOCIATION_RETAIN);
}

- (NSDateFormatter *)dateFormatter
{
    return objc_getAssociatedObject(self, @selector(dateFormatter));
}

/****************************************************************/

- (BOOL)isDate
{
    return [self isKindOfClass:NSDate.class];
}

#pragma mark - date/timeInterval

/// 获取任意时间，即时间戳NSTimeInterval转NSDate
+ (NSDate *)dateWithTimeInterval:(NSTimeInterval)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return date;
}

/// 获取任意时间秒数，即NSDate转NSTimeInterval
- (NSTimeInterval)timeInterval
{
    if (self) {
        NSTimeInterval timeSecond = [self timeIntervalSince1970];
        return timeSecond;
    }
    return 0;
}

/// NSDate根据时间格式Formater显示时间字符串
- (NSString *)timeStringWithFormat:(NSString *)format
{
    if (self.dateFormatter == nil) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
    }
    self.dateFormatter.dateFormat = format;
    NSString *result = [self.dateFormatter stringFromDate:self];
    return result;
}

/// 根据时间格式Format将时间戳NSTimeInterval转换成时间字符串（秒数转化成yyyy-MM-dd hh:mm:ss格式）
+ (NSString *)timeStrWithTimeInterval:(NSTimeInterval)time format:(NSString *)format
{
    NSDate *date = [NSDate dateWithTimeInterval:time];
    NSString *result = [date timeStringWithFormat:format];
    return result;
}

/// 时间字符串根据时间格式Format转换成NSDate（time格式与format必须一致，否则返回nil）
+ (NSDate *)dateWithTimeString:(NSString *)time format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:time];
    return date;
}

#pragma mark - private 转换（NSDateComponents/NSDate）

/// NSDate转换成NSDateComponents
+ (NSDateComponents *)getDateCompontsWithDate:(NSDate *)date
{
    if (date.isDate) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSInteger unitFlags = (NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal);
        NSDateComponents *component = [calendar components:unitFlags fromDate:date];
        
        return component;
    }
    return nil;
}

/// NSTimeInterval转换成NSDateComponents
+ (NSDateComponents *)getDateComponentsWithTimeInterval:(long long)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateComponents *component = [self getDateCompontsWithDate:date];
    return component;
}

#pragma mark - 年/月/日/时/分/秒/周

/// 获取年份
- (NSInteger)year
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger yearNumber = component.year;
        return yearNumber;
    }
    return 0;
}

/// 获取月份
- (NSInteger)month
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger monthNumber = component.month;
        return monthNumber;
    }
    return 0;
}

/// 获取日期
- (NSInteger)day
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger dayNumber = component.day;
        return dayNumber;
    }
    return 0;
}

/// 获取小时
- (NSInteger)hour
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger hour = component.hour;
        return hour;
    }
    return 0;
}

/// 获取分钟
- (NSInteger)minute
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger minute = component.minute;
        return minute;
    }
    return 0;
}

/// 获取秒
- (NSInteger)second
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger minute = component.second;
        return minute;
        
    }
    return 0;
}

/// 获取星期（一、二、三、四、五、六、日）
- (NSString *)week
{
    if (self) {
        NSDateComponents *component = [NSDate getDateCompontsWithDate:self];
        NSInteger weekday = component.weekday;
        NSString *weekStr;
        switch (weekday) {
            case 1: weekStr = @"日"; break;
            case 2: weekStr = @"一"; break;
            case 3: weekStr = @"二"; break;
            case 4: weekStr = @"三"; break;
            case 5: weekStr = @"四"; break;
            case 6: weekStr = @"五"; break;
            case 7: weekStr = @"六"; break;
            default: break;
        }
        return weekStr;
        
    }
    return nil;
}

#pragma mark 当前时间（年/月/日/时/分/秒/周）

/// 获取当前日期 NSDate（直接显示会出现相差8个小时，使用NSDateFormatter时间格式则不会）
+ (NSDate *)dateOfNower
{
    NSDate *currentDate = [NSDate date];
    return currentDate;
}

/// 获取当前时间戳
+ (NSTimeInterval)timeIntervalOfNower
{
    NSTimeInterval time = NSDate.dateOfNower.timeInterval;
    return time;
}

/// 获取当前时间（指定格式）
+ (NSString *)timeStringOfNowerWithFormat:(NSString *)format
{
    NSDate *nowDate = NSDate.dateOfNower;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = format;
    NSString *time = [dateFormatter stringFromDate:nowDate];
    return time;
}

/// 获取当前时间
+ (NSString *)timeStringOfNower
{
    NSDate *nowDate = NSDate.dateOfNower;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    NSString *time = [dateFormatter stringFromDate:nowDate];
    return time;
}

/// 获取当前年份
+ (NSInteger)yearOfNower
{
    NSInteger yearNumber = NSDate.dateOfNower.year;
    return yearNumber;
}

/// 获取当前月份
+ (NSInteger)monthOfNower
{
    NSInteger monthNumber = NSDate.dateOfNower.month;
    return monthNumber;
}

/// 获取当前日期
+ (NSInteger)dayOfNower
{
    NSInteger dayNumber = NSDate.dateOfNower.day;
    return dayNumber;
}

/// 获取当前小时
+ (NSInteger)hourOfNower
{
    NSInteger hour = NSDate.dateOfNower.hour;
    return hour;
}

/// 获取当前分钟
+ (NSInteger)minuteOfNower
{
    NSInteger minute = NSDate.dateOfNower.minute;
    return minute;
}

/// 获取当前秒
+ (NSInteger)secondOfNower
{
    NSInteger minute = NSDate.dateOfNower.second;
    return minute;
}

/// 获取当前星期
+ (NSString *)weekOfNower
{
    NSString *weekday = NSDate.dateOfNower.week;
    return weekday;
}

#pragma mark - 时间差

/// 根据时间戳NSTimeInterval计算时间间隔数
+ (NSString *)timeStringWithTimeInterval:(NSTimeInterval)comparetime
{
    NSDate *compareDate = [self dateWithTimeInterval:comparetime];
    NSDate *currentDate = NSDate.dateOfNower;
    NSString *result = [self timeStringWithBeginDate:compareDate endDate:currentDate];
    return result;
}

/// 计算两个日期距离现在多久
+ (NSString *)timeStringWithBeginTime:(NSString *)beginTime beginTimeFormat:(NSString *)beginFormat endTime:(NSString *)endTime endTimeFormat:(NSString *)endFormat
{
    // 上次时间
    NSDate *dateLast = [NSDate dateWithTimeString:beginTime format:beginFormat];
    // 当前时间
    NSDate *dateNow = [NSDate dateWithTimeString:endTime format:endFormat];

    // 时间间距
    NSString *resutl = [self timeStringWithBeginDate:dateLast endDate:dateNow];
    return resutl;
}

/// 计算两个日期距离现在多久
+ (NSString *)timeStringWithBeginDate:(NSDate *)beginDate endDate:(NSDate *)endDate
{
    // 时间间距
    NSInteger intervalTime = endDate.timeInterval - beginDate.timeInterval;
    
    // 秒、分、小时、天、月、年
    NSInteger minutes = intervalTime / 60;
    NSInteger hours = intervalTime / 60 / 60;
    NSInteger day = intervalTime / 60 / 60 / 24;
    NSInteger month = intervalTime / 60 / 60 / 24 / 30;
    NSInteger years = intervalTime / 60 / 60 / 24 / 365;
    
    NSString *resutl = nil;
    if (minutes < 10) {
        resutl = @"刚刚";
    } else if (minutes < 60) {
        resutl = [NSString stringWithFormat:@"%@分钟前", @(minutes)];
    } else if (hours < 24) {
        resutl = [NSString stringWithFormat:@"%@小时前", @(hours)];
    } else if (day < 30) {
        resutl = [NSString stringWithFormat:@"%@天前", @(day)];
    } else if (month < 12) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"M月d日";
        resutl = [dateFormatter stringFromDate:beginDate];
    } else if (years >= 1) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy年M月d日";
        resutl = [dateFormatter stringFromDate:beginDate];
    }
    
    return resutl;
}

/// 获取某个时间的N天的前天或后天
+ (NSDate *)dateWithDate:(NSDate *)date day:(NSInteger)day tomorrow:(BOOL)tomorrow
{
    NSTimeInterval secondsPerDay = (24 * 60 * 60) * day;
    if (!tomorrow) {
        // 之前
        secondsPerDay = -secondsPerDay;
    }
    NSTimeInterval time = date.timeInterval;
    time += secondsPerDay;
    NSDate *perDate = [NSDate dateWithTimeIntervalSince1970:time];
    return perDate;
}

/// 从现在开始的24小时之后或之前的某个时间NSDate（如明天，后天）
+ (NSDate *)dateFromNowWithDay:(float)day after:(BOOL)after
{
    NSTimeInterval secondsPerDay = (24 * 60 * 60) * day;
    if (!after) {
        // 之前
        secondsPerDay = -secondsPerDay;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:secondsPerDay];
    return date;
}

/// 从现在开始的24小时之后或之前的某个时间NSString（如明天，后天）
+ (NSString *)timeStringFromNowStrWithDay:(float)day after:(BOOL)after format:(NSString *)format
{
    NSDate *date = [self dateFromNowWithDay:day after:after];
    NSString *result = [date timeStringWithFormat:format];
    return result;
}

+ (NSDateComponents *)dateComponentsWithBeginDate:(NSDate *)beginDate endDate:(NSDate *)endDate
{
    // 创建日历对象
    NSCalendar *calendar = [[NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    // 设置组件标志识
    NSUInteger unitFlags = (NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
    // 创建日期组件对象，由日历对象通过起止日期及标识创建
    NSDateComponents *compoents = [calendar components:unitFlags fromDate:beginDate toDate:endDate options:0];
    return compoents;
}

+ (NSDictionary *)timeDistanceWithTimeInterval:(NSTimeInterval)time endTimeInterval:(NSTimeInterval)endTime
{
    NSTimeInterval currentTime = endTime - time;
    currentTime = fabs(currentTime);
    NSDictionary *dict = [NSDate timeDistanceWithTimeInterval:currentTime];
    return dict;
}

+ (NSDictionary *)timeDistanceWithTimeInterval:(NSTimeInterval)time
{
    NSTimeInterval currentTime = time;
    
    NSInteger year = currentTime / (365 * 24 * 60 * 60);
    NSInteger yearTmp = (int)currentTime % (365 * 24 * 60 * 60);
    
    NSInteger month = yearTmp / (30 * 24 * 60 * 60);
    NSInteger monthTmp = (NSInteger)yearTmp % (30 * 24 * 60 * 60);
    
    NSInteger day = monthTmp / (24 * 60 * 60);
    NSInteger dayTmp = (int)monthTmp % (24 * 60 * 60);
    
    NSInteger hour = dayTmp / (60 * 60);
    NSInteger hourTmp = dayTmp % (60 * 60);
    
    NSInteger minute = hourTmp / 60;
    NSInteger second = hourTmp % 60;
    
    NSDictionary *dict = @{keyYear:@(year), keyMonth:@(month), keyDay:@(day), keyHour:@(hour), keyMinute:@(minute), keySecond:@(second)};
    return dict;
}

+ (NSDictionary *)timeDistanceWithDate:(NSDate *)dateBegin date:(NSDate *)dateEnd
{
    NSDate *nowData = dateBegin;
    NSDate *endData = dateEnd;
    
    NSCalendar *chineseClendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    NSUInteger unitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    NSDateComponents *components = [chineseClendar components:unitFlags fromDate:nowData toDate: endData options:0];
    NSInteger hour = components.hour;
    NSInteger minute = components.minute;
    NSInteger second = components.second;
    NSInteger day = components.day;
    NSInteger month = components.month;
    NSInteger year = components.year;
    
    NSDictionary *dict = @{keyYear:@(year), keyMonth:@(month), keyDay:@(day), keyHour:@(hour), keyMinute:@(minute), keySecond:@(second)};
    return dict;
}

/// 计算任意两个时间戳之间的间隔（秒、分、时、日、月、年）
+ (NSInteger)timeDistanceWithTimeInterval:(NSTimeInterval)time endTimeInterval:(NSTimeInterval)endTime mode:(SYDistanceMode)mode
{
    NSDictionary *dict = [NSDate timeDistanceWithTimeInterval:time endTimeInterval:endTime];
    NSInteger year = ((NSNumber *)dict[keyYear]).integerValue;
    NSInteger month = ((NSNumber *)dict[keyMonth]).integerValue;
    NSInteger day = ((NSNumber *)dict[keyDay]).integerValue;
    NSInteger hour = ((NSNumber *)dict[keyHour]).integerValue;
    NSInteger minute = ((NSNumber *)dict[keyMinute]).integerValue;
    NSInteger second = ((NSNumber *)dict[keySecond]).integerValue;
    
    NSTimeInterval distance = year;
    if (SYDistanceModeYear == mode) {
        distance = year;
    } else if (SYDistanceModeMonth == mode) {
        distance = month;
    } else if (SYDistanceModeDay == mode) {
        distance = day;
        distance += (year * 365 + month * 30);
    } else if (SYDistanceModeHour == mode) {
        distance = hour;
        distance += (year * 365 * 24 + month * 30 * 24 + day * 24);
    } else if (SYDistanceModeMinute == mode) {
        distance = minute;
        distance += (year * 365 * 24 * 60 + month * 30 * 24 * 60 + day * 24 * 60 + hour * 60);
    } else if (SYDistanceModeSecond == mode) {
        distance = second;
        distance += (year * 365 * 24 * 60 * 60 + month * 30 * 24 * 60 * 60 + hour * 60 * 60 + minute * 60);
    }
    return distance;
}

/// 计算任意两个日期间的天数
+ (NSInteger)dayBetweenDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSInteger result = [NSDate timeDistanceWithTimeInterval:startDate.timeInterval endTimeInterval:endDate.timeInterval mode:SYDistanceModeDay];
    return result;
}

/// 任意两个日期间的秒数
+ (NSInteger)timeIntervalBetweenDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    NSInteger result = [NSDate timeDistanceWithTimeInterval:startDate.timeInterval endTimeInterval:endDate.timeInterval mode:SYDistanceModeSecond];
    return result;
}

/// 时间戳NSTimeInterval计算时间间隔（秒、分、时、日、月、年）
+ (NSInteger)timeDistanceWithTimeInterval:(NSTimeInterval)time mode:(SYDistanceMode)mode
{
    NSDate *nowDate = NSDate.dateOfNower;
    NSInteger distance = [NSDate timeDistanceWithTimeInterval:time endTimeInterval:nowDate.timeInterval mode:mode];
    return distance;
}

/// 时间戳NSTimeInterval计算时间格式显示
+ (NSString *)timeStrWithTimeInterval:(NSTimeInterval)time mode:(SYTimeShowMode)mode
{
    NSTimeInterval nowerTime = NSDate.dateOfNower.timeInterval;
    NSTimeInterval currentTime = nowerTime - time;
    
    int day = currentTime / (24 * 60 * 60);
    int dayTmp = (int)currentTime % (24 * 60 * 60);
    int hour = dayTmp / (60 * 60);
    int hourTmp = dayTmp % (60 * 60);
    int minute = hourTmp / 60;
    int second = hourTmp % 60;
    
    NSString *string = nil;
    if (SYTimeShowModeDefault == mode) {
        string = [NSString stringWithFormat:@"%d天%d时%d分%d秒", day, hour, minute, second];
        if (0 == day) {
            string = [NSString stringWithFormat:@"%d时%d分%d秒", hour, minute, second];
            if (0 == hour) {
                string = [NSString stringWithFormat:@"%d分%d秒", minute, second];
            }
        }
    } else if (SYTimeShowModeDefaultWithSecond == mode) {
        string = [NSString stringWithFormat:@"%d天%d时%d分", day, hour, minute];
        if (0 == day) {
            string = [NSString stringWithFormat:@"%d时%d分", hour, minute];
        }
    } else if (SYTimeShowModeDayHourMinuteSecond == mode) {
        string = [NSString stringWithFormat:@"%d天%d时%d分%d秒", day, hour, minute, second];
    } else if (SYTimeShowModeDayHourMinute == mode) {
        string = [NSString stringWithFormat:@"%d天%d时%d分", day, hour, minute];
    } else if (SYTimeShowModeHourMinuteSecond == mode) {
        string = [NSString stringWithFormat:@"%d时%d分%d秒", (hour + day * 24), minute, second];
    } else if (SYTimeShowModeHourMinute == mode) {
        string = [NSString stringWithFormat:@"%d时%d分", (hour + day * 24), minute];
    }
    
    return string;
}

/// 时间戳NSTimeInterval显示格式字符串
+ (NSString *)timeStringWithFormatTime:(NSTimeInterval)time
{
    // 1.获取当前的时间
    NSDate *currentDate = NSDate.dateOfNower;
    // 1.1获取年，月，日
    NSInteger currentYear = currentDate.year;
    NSInteger currentMonth = currentDate.month;
    NSInteger currentDay = currentDate.day;
    
    // 2.获取消息发送时间
    NSDate *msgDate = [NSDate dateWithTimeInterval:time];
    // 2.1获取年，月，日
    NSInteger msgYear = msgDate.year;
    NSInteger msgMonth = msgDate.month;
    NSInteger msgDay = msgDate.day;
    
    // 3.判断:
    /*
     今天：(HH:mm)
     昨天: (昨天 HH:mm)
     昨天以前:（2016-07-27 16:07）
     */
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay) {
        // 今天
        dateFormat.dateFormat = @"HH:mm";
    } else if (currentYear == msgYear && currentMonth == msgMonth && (currentDay - 1) == msgDay) {
        // 昨天
        dateFormat.dateFormat = [NSString stringWithFormat:@"昨天 %@", @"HH:mm"];
    } else {
        // 昨天以前
        dateFormat.dateFormat = @"yyyy-MM-dd HH:mm";
    }
    
    return [dateFormat stringFromDate:msgDate];
}

/// 时间戳NSTimeInterval转对应时间单位的字符串
+ (NSString *)timeStringFromNSTimeInterval:(NSTimeInterval)second
{
    NSString *time = [NSString stringWithFormat:@"%.0f秒", second];
    if (second > (60 * 60 * 24)) {
        second = (second / (60 * 60 * 24));
        time = [NSString stringWithFormat:@"%.0f天", second];
    } else if (second > (60 * 60)) {
        second = (second / (60 * 60));
        time = [NSString stringWithFormat:@"%.0f小时", second];
    } else if (second > 60) {
        second = second / 60;
        time = [NSString stringWithFormat:@"%.0f分钟", second];
    }
    return time;
}

@end
