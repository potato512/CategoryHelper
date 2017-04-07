//
//  NSNotificationCenter+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNotificationCenter+SYCategory.h"

@implementation NSNotificationCenter (SYCategory)

/**
 *  发送通知
 *
 *  @param name 通知名称
 *  @param dict 通知协带参数
 */
void NSNotificationCenterPost(NSString *name, NSDictionary *dict)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:dict];
}

/**
 *  接收通知
 *
 *  @param name   通知名称
 *  @param target 通知中执行方法的对象
 *  @param action 通知中响应的方法
 */
void NSNotificationCenterReceive(NSString *name, id target, SEL action)
{
    [[NSNotificationCenter defaultCenter] addObserver:target selector:action name:name object:nil];
}

/**
 *  移除通知
 *
 *  @param name   通知名称
 *  @param target 通知中执行方法的对象
 */
void NSNotificationCenterRemove(NSString *name, id target)
{
    [[NSNotificationCenter defaultCenter] removeObserver:target name:name object:nil];
}


@end
