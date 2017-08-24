//
//  NSNumber+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNumber+SYCategory.h"

@implementation NSNumber (SYCategory)

#pragma mark - 字符串转数值

/// string转double
+ (double)doubleWithString:(NSString *)string
{
    return string.doubleValue;
}

/// string转float
+ (float)floatWithString:(NSString *)string
{
    return string.floatValue;
}

/// string转int
+ (int)intWithString:(NSString *)string
{
    return string.intValue;
}

/// 保留2位小数
+ (double)keepTwoDecimalsDoubleValue:(double)number
{
    return round(number * 100.0)/100.0;
}

/// 获取一个随机整数，范围在[from,to）
+ (int)randomNumber:(int)from to:(int)to
{
    return (int)(from + (arc4random() % (to-from + 1)));
}

/// 阿拉伯数字转罗马大写
- (NSString *)numberConvertedUpperRoman
{
    NSInteger number = self.integerValue;
    switch (number)
    {
        case 1: return @"一"; break;
        case 2: return @"二"; break;
        case 3: return @"三"; break;
        case 4: return @"四"; break;
        case 5: return @"五"; break;
        case 6: return @"六"; break;
        case 7: return @"七"; break;
        case 8: return @"八"; break;
        case 9: return @"九"; break;
        default: break;
    }
    return nil;
}

/// 阿拉伯数字转中文大写
- (NSString *)numberConvertedCNCapital
{
    NSInteger number = self.integerValue;
    switch (number)
    {
        case 0: return @"零"; break;
        case 1: return @"壹"; break;
        case 2: return @"贰"; break;
        case 3: return @"叁"; break;
        case 4: return @"肆"; break;
        case 5: return @"伍"; break;
        case 6: return @"陆"; break;
        case 7: return @"柒"; break;
        case 8: return @"捌"; break;
        case 9: return @"玖"; break;
        default: break;
    }
    return nil;
}

@end
