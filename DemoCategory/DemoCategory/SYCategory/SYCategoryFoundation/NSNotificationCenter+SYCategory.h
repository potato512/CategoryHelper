//
//  NSNotificationCenter+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (SYCategory)

/// 发送通知
+ (void)postNotificationWithName:(NSString *)name;

/// 接收通知
+ (void)receiveNotificationWithName:(NSString *)name target:(id)target sel:(SEL)selector;

/// 移除通知
+ (void)removeNotificationWithName:(NSString *)name target:(id)target;

@end
