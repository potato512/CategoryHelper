//
//  NSTimer+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

/*
 示例：
 内存管理
 
 - (void)viewWillDisappear:(BOOL)animated
 {
    [super viewWillDisappear:animated];
    [self.timer timerKill];
 }
 
 */

#import <Foundation/Foundation.h>

typedef void (^TimerBlock)(NSTimer *timer);

@interface NSTimer (SYCategory)

/// 开启定时器
- (void)timerStart;

/// 关闭定时器
- (void)timerStop;

/// 永久停止定时器
- (void)timerKill;

/// NSTimerInitialize实例化NSTimer
NSTimer *NSTimerInitialize(NSTimeInterval time, id target, SEL action, id object, BOOL repeat);

/// NSTimerScheduled实例化NSTimer
NSTimer *NSTimerScheduled(NSTimeInterval time, id target, SEL selector, id object, BOOL repeat);

/// 实例化NSTimer timerScheduledWithTimeInterval
+ (NSTimer *)timerScheduledWithTimeInterval:(NSTimeInterval)time target:(id)target selector:(SEL)selector object:(id)object repeat:(BOOL)repeat;


/// 实例化NSTimer timerWithTimeInterval
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)time userInfo:(id)userInfo repeats:(BOOL)isRepeat handle:(void (^)(NSTimer *timer))handle;

/// 倒计时
+ (void)timerGCDWithTimeInterval:(NSTimeInterval)time maxTimerInterval:(NSInteger)maxTime afterTime:(NSTimeInterval)afterTime handle:(void (^)(NSInteger remainTime))handle;

@end
