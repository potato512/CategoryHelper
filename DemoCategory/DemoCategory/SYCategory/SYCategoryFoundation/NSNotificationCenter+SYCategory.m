//
//  NSNotificationCenter+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNotificationCenter+SYCategory.h"

@implementation NSNotificationCenter (SYCategory)

/// 发送通知
+ (void)postNotificationWithName:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
}

/// 接收通知
+ (void)receiveNotificationWithName:(NSString *)name target:(id)target sel:(SEL)selector
{
    [self removeNotificationWithName:name target:target];
    [[NSNotificationCenter defaultCenter] addObserver:target selector:selector name:name object:nil];
}

/// 移除通知
+ (void)removeNotificationWithName:(NSString *)name target:(id)target
{
    [[NSNotificationCenter defaultCenter] removeObserver:target name:name object:nil];
}

@end
