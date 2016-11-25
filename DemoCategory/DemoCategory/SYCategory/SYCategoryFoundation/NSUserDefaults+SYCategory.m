//
//  NSUserDefaults+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSUserDefaults+SYCategory.h"

@implementation NSUserDefaults (SYCategory)

/// 保存信息
+ (void)saveUserDefault:(id)object key:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/// 读取保存的信息
+ (NSDictionary *)getUserDefaultWithKey:(NSString *)key
{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return dict;
}

/// 删除保存的信息
+ (void)deleteUserDefaultWithKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
