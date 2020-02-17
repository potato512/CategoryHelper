//
//  NSObject+SYGCD.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/11/20.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CompleteHandleVoid)(void);
typedef void(^CompleteHandleInteger)(NSInteger index);

@interface NSObject (SYGCD)

#pragma mark - dispatch_async的使用

/// GCD子线程执行（同步或异步）
void GCDGlobalAsync(BOOL isAsynchronous, CompleteHandleVoid complete);

/// GCD主线程执行（同步或异步）
void GCDMainAsync(BOOL isAsynchronous, CompleteHandleVoid complete);

/// GCD一次性执行执行（同步函数）
void GCDOnceAsync(CompleteHandleVoid complete);

/// GCD指定延迟时间执行（异步函数）
void GCDDelayAsync(NSTimeInterval time, CompleteHandleVoid complete);

#pragma mark - dispatch_group_t多组线程并行

/**
 GCD并行执行开始，多个线程同时执行（异步函数）
 dispatch_group_async的使用
 dispatch_group_async可以实现监听一组任务是否完成，完成后得到通知执行其他的操作。
 这个方法很有用，比如你执行三个下载任务，当三个任务都下载完成后你才通知界面说完成的了。
 */
void GCDGroupStartAsync(dispatch_group_t group, CompleteHandleVoid complete);

/// GCD并行执行结束，多个线程执行都完成（异步函数）
void GCDGroupFinishAsync(dispatch_group_t group, CompleteHandleVoid complete);

#pragma mark - dispatch_barrier_async栅栏函数

/*
 dispatch_barrier_async的使用
 dispatch_barrier_async是在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
 */

/// GCD串行执行，逐个执行开始（isAsynchronous=YES时，逐个执行，否则无顺序同时执行。注：两者须一致）
void GCDBarrierStartAsync(dispatch_queue_t queue, BOOL isAsynchronous, CompleteHandleVoid complete);

/// GCD串行执行，逐个执行到最后（isAsynchronous=YES时，逐个执行，否则无顺序同时执行。注：两者须一致）
void GCDBarrierFinishAsync(dispatch_queue_t queue, BOOL isAsynchronous, CompleteHandleVoid complete);

#pragma mark - dispatch_apply

/**
 GCD多次执行某个指定方法（同步函数）
 dispatch_apply方法中的全部处理任务执行结束
 执行某个代码片段N次。
 
 */
void GCDApplyAsync(NSInteger count, CompleteHandleInteger complete);

@end

NS_ASSUME_NONNULL_END
