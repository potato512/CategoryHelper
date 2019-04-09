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
    if ([self respondsToSelector:@selector(setFireDate:)]) {
        [self setFireDate:[NSDate distantPast]];
    }
}

/// 关闭定时器
- (void)timerStop
{
    if ([self respondsToSelector:@selector(setFireDate:)]) {
        [self setFireDate:[NSDate distantFuture]];
    }
}

/// 永久停止定时器
- (void)timerKill
{
    [self timerStop];
    [self invalidate];
}

/// NSTimerInitialize实例化NSTimer
NSTimer *NSTimerInitialize(NSTimeInterval time, id target, SEL action, id object, BOOL repeat)
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:time target:target selector:action userInfo:object repeats:repeat];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer timerStop];
    
    return timer;
}

/// NSTimerScheduled实例化NSTimer
NSTimer *NSTimerScheduled(NSTimeInterval time, id target, SEL selector, id object, BOOL repeat)
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:time target:target selector:selector userInfo:object repeats:repeat];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}

/// 实例化NSTimer timerScheduledWithTimeInterval
+ (NSTimer *)timerScheduledWithTimeInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector object:(id)object repeat:(BOOL)repeat
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:time target:target selector:selector userInfo:object repeats:repeat];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    return timer;
}


/// 实例化NSTimer timerWithTimeInterval
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)time userInfo:(id)userInfo repeats:(BOOL)isRepeat handle:(void (^)(NSTimer *timer))handle
{
    TimerBlock timerBlock = [handle copy];
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:timerBlock];
    if (userInfo) {
        [array addObject:userInfo];
    }
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:time target:self selector:@selector(timerBlock:) userInfo:array repeats:isRepeat];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [timer timerStop];
    
    return timer;
}

+ (void)timerBlock:(NSTimer *)timer
{
    NSArray *array = timer.userInfo;
    TimerBlock timerBlock = array.firstObject;
    if (timerBlock) {
        timerBlock(timer);
    }
}

#pragma mark -

// 倒计时
+ (void)timerGCDWithTimeInterval:(NSTimeInterval)time maxTimerInterval:(NSInteger)maxTime afterTime:(NSTimeInterval)afterTime handle:(void (^)(NSInteger remainTime))handle
{
    if (0 >= maxTime) {
        return;
    }
    
    __block NSTimeInterval countdownTime = maxTime;

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行（毫秒计）
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), (time * NSEC_PER_SEC), 0);
    dispatch_source_set_event_handler(timer, ^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(afterTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
            if (0 >= countdownTime) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handle) {
                        handle(0);
                    }
                });
                dispatch_source_cancel(timer);
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (handle) {
                        handle(countdownTime);
                    }
                });
                countdownTime--;
            }

        });
    });

    dispatch_resume(timer);
}

@end
