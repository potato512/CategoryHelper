//
//  NSObject+SYGCD.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/11/20.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "NSObject+SYGCD.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@implementation NSObject (SYGCD)

#pragma mark - dispatch_async的使用

/// GCD子线程执行（同步或异步）
void GCDGlobalAsync(BOOL isAsynchronous, CompleteHandleVoid complete)
{
    // 后台执行
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (isAsynchronous) {
        // 异步
        dispatch_async(queue, ^{
            if (complete) {
                complete();
            }
        });
    } else {
        // 同步
        dispatch_sync(queue, ^{
            if (complete) {
                complete();
            }
        });
    }
}

/// GCD主线程执行（同步或异步）
void GCDMainAsync(BOOL isAsynchronous, CompleteHandleVoid complete)
{
    if (isAsynchronous) {
        // 主线程执行-异步
        dispatch_async(dispatch_get_main_queue(), ^{
            if (complete) {
                complete();
            }
        });
    } else {
        // 主线程执行-同步
        dispatch_async(dispatch_get_main_queue(), ^{
            if (complete) {
                complete();
            }
        });
    }
}

/// GCD一次性执行执行（同步函数）
void GCDOnceAsync(CompleteHandleVoid complete)
{
    // 一次性执行
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (complete) {
            complete();
        }
    });
}

/// GCD指定延迟时间执行（异步函数）
void GCDDelayAsync(NSTimeInterval time, CompleteHandleVoid complete)
{
    // 延迟执行
    NSTimeInterval delayInSeconds = time;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (complete) {
            complete();
        }
    });
}

#pragma mark - dispatch_group_t多组线程并行

/**
 GCD并行执行开始，多个线程同时执行（异步函数）
 dispatch_group_async的使用
 dispatch_group_async可以实现监听一组任务是否完成，完成后得到通知执行其他的操作。
 这个方法很有用，比如你执行三个下载任务，当三个任务都下载完成后你才通知界面说完成的了。
 */
void GCDGroupStartAsync(dispatch_group_t group, CompleteHandleVoid complete)
{
    // dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group, queue, ^{
        if (complete) {
            complete();
        }
    });
}

/// GCD并行执行结束，多个线程执行都完成（异步函数）
void GCDGroupFinishAsync(dispatch_group_t group, CompleteHandleVoid complete)
{
    // dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_group_notify(group, queue, ^{
        if (complete) {
            complete();
        }
    });
}

#pragma mark - dispatch_barrier_async栅栏函数

/*
 dispatch_barrier_async的使用
 dispatch_barrier_async是在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行
 */

/// GCD串行执行，逐个执行开始（isAsynchronous=YES时，逐个执行，否则无顺序同时执行。注：两者须一致）
void GCDBarrierStartAsync(dispatch_queue_t queue, BOOL isAsynchronous, CompleteHandleVoid complete)
{
    // dispatch_queue_t queue = dispatch_queue_create(charString, DISPATCH_QUEUE_CONCURRENT);
    if (isAsynchronous) {
        // 异步
        dispatch_barrier_async(queue, ^{
            if (complete) {
                complete();
            }
        });
    } else {
        // 同步
        dispatch_barrier_sync(queue, ^{
            if (complete) {
                complete();
            }
        });
    }
}

/// GCD串行执行，逐个执行到最后（isAsynchronous=YES时，逐个执行，否则无顺序同时执行。注：两者须一致）
void GCDBarrierFinishAsync(dispatch_queue_t queue, BOOL isAsynchronous, CompleteHandleVoid complete)
{
    // dispatch_queue_t queue = dispatch_queue_create(charString, DISPATCH_QUEUE_CONCURRENT);
    if (isAsynchronous) {
        // 异步
        dispatch_barrier_async(queue, ^{
            if (complete) {
                complete();
            }
        });
    } else {
        // 同步
        dispatch_barrier_sync(queue, ^{
            if (complete) {
                complete();
            }
        });
    }
}

#pragma mark - dispatch_apply

/**
 GCD多次执行某个指定方法（同步函数）
 dispatch_apply方法中的全部处理任务执行结束
 执行某个代码片段N次。
 
 */
void GCDApplyAsync(NSInteger count, CompleteHandleInteger complete)
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(count, queue, ^(size_t index){
        if (complete) {
            complete(index);
        }
    });
}


@end
