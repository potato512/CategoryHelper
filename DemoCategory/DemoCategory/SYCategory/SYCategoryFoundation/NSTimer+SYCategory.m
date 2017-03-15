//
//  NSTimer+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSTimer+SYCategory.h"

@implementation NSTimer (SYCategory)

/// 开启定时器
- (void)timerStart
{
    [self setFireDate:[NSDate distantPast]];
}

/// 关闭定时器
- (void)timerStop
{
    [self setFireDate:[NSDate distantFuture]];
}

/// 永久停止定时器
- (void)timerKill
{
    [self timerStop];
    [self invalidate];
}


NSTimer *NSTimerInitialize(NSTimeInterval time, id target, SEL action, id object, BOOL repeat)
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:time target:target selector:action userInfo:object repeats:repeat];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer timerStop];
    
    return timer;
}

@end
