//
//  NSMutableDictionary+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSMutableDictionary+SYCategory.h"

@implementation NSMutableDictionary (SYCategory)

#pragma mark - 链式属性

- (NSMutableDictionary *(^)(id object, NSString *key))addObject
{
    return ^(id object, NSString *key) {
        if (object && key)
        {
            [self setObject:object forKey:key];
        }
        return self;
    };
}

- (NSMutableDictionary *(^)(NSString *key))removeOjbectForKey
{
    return ^(NSString *key) {
        if (key)
        {
            [self removeObjectForKey:key];
        }
        return self;
    };
}

- (NSMutableDictionary *(^)())removeAllObject
{
    return ^() {
        [self removeAllObjects];
        return self;
    };
}

@end
