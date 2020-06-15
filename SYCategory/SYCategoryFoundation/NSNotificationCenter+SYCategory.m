//
//  NSNotificationCenter+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSNotificationCenter+SYCategory.h"
#import <objc/runtime.h>
#import "NSString+SYCategory.h"

@interface NSNotificationCenter ()

// add by zhangshaoyu, 2017-04-20
@property (nonatomic, copy) void (^NotificationBlock)(NSNotification *notification);

@end

@implementation NSNotificationCenter (SYCategory)

/**
 *  发送通知
 *
 *  @param name     通知名称
 *  @param object   通知协带参数
 *  @param userInfo 通知协带参数
 */
void NSNotificationCenterPost(NSString *name, id object, NSDictionary *userInfo)
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
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
    NSNotificationCenterRemove(name, target);
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
    if (name.isValidNSString) {
        [[NSNotificationCenter defaultCenter] removeObserver:target name:name object:nil];
    } else {
        [NSNotificationCenter.defaultCenter removeObserver:target];
    }
}

/************************************************************************************************************/

// add by zhangshaoyu, 2017-04-20
- (void)setNotificationBlock:(void (^)(NSNotification *))NotificationBlock
{
    objc_setAssociatedObject(self, @selector(NotificationBlock), NotificationBlock, OBJC_ASSOCIATION_COPY);
}

// add by zhangshaoyu, 2017-04-20
- (void (^)(NSNotification *))NotificationBlock
{
    return objc_getAssociatedObject(self, @selector(NotificationBlock));
}

/**
 *  接收通知并执行回调
 *  add by zhangshaoyu, 2017-04-20
 *  @param name   通知名称
 *  @param handle 响应回调
 */
- (void)receiveNotification:(NSString *)name handle:(void (^)(NSNotification *notification))handle
{
    self.NotificationBlock = [handle copy];
    NSNotificationCenterReceive(name, self, @selector(notificationMethord:));
}

- (void)notificationMethord:(NSNotification *)notification
{
    if (self.NotificationBlock) {
        self.NotificationBlock(notification);
    }
}

@end
