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

@end
