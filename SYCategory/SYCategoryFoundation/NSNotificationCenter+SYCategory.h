//
//  NSNotificationCenter+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (SYCategory)

/**
 *  发送通知
 *
 *  @param name     通知名称
 *  @param object   通知协带参数
 *  @param userInfo 通知协带参数
 */
void NSNotificationCenterPost(NSString *name, id object, NSDictionary *userInfo);

/**
 *  接收通知
 *
 *  @param name   通知名称
 *  @param target 通知中执行方法的对象
 *  @param action 通知中响应的方法
 */
void NSNotificationCenterReceive(NSString *name, id target, SEL action);

/**
 *  移除通知
 *
 *  @param name   通知名称
 *  @param target 通知中执行方法的对象
 */
void NSNotificationCenterRemove(NSString *name, id target);

/************************************************************************************************************/

/**
 *  接收通知并执行回调
 *  add by zhangshaoyu, 2017-04-20
 *  @param name   通知名称
 *  @param handle 响应回调
 */
- (void)receiveNotification:(NSString *)name handle:(void (^)(NSNotification *notification))handle;


@end
