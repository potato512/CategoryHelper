//
//  NSMutableArray+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSMutableArray+SYCategory.h"

@implementation NSMutableArray (SYCategory)

#pragma mark - 链式属性

- (NSMutableArray *(^)(id object))addObject
{
    return ^(id object) {
        if (object)
        {
            [self addObject:object];
        }
        return self;
    };
}

- (NSMutableArray *(^)(id object, NSInteger index))addObjectAtIndex
{
    return ^(id object, NSInteger index) {
        if (object && (0 <= index || self.count - 1 >= index))
        {
            [self insertObject:object atIndex:index];
        }
        return self;
    };
}

- (NSMutableArray *(^)(id object, NSInteger index))setOjbectAtIndex
{
    return ^(id object, NSInteger index) {
        if (object && (0 <= index || self.count - 1 >= index))
        {
            [self setObject:object atIndexedSubscript:index];
        }
        return self;
    };
}

- (NSMutableArray *(^)(NSArray *array))addArray
{
    return ^(NSArray *array) {
        if (array && 0 < array.count)
        {
            [self addObjectsFromArray:array];
        }
        return self;
    };
}

- (NSMutableArray *(^)(NSArray *array, NSIndexSet *index))addArrayAtIndex
{
    return ^(NSArray *array, NSIndexSet *index) {
        if ((array && 0 < array.count) && index)
        {
            [self insertObjects:array atIndexes:index];
        }
        return self;
    };
}

- (NSMutableArray *(^)(id object, NSInteger index))replaceObjectAtIndex
{
    return ^(id object, NSInteger index) {
        if (object && (0 <= index || self.count - 1 >= index))
        {
            [self replaceObjectAtIndex:index withObject:object];
        }
        return self;
    };
}

- (NSMutableArray *(^)())removeFirstObject
{
    return ^() {
        id object = self.firstObject;
        [self removeObject:object];
        return self;
    };
}

- (NSMutableArray *(^)())removeLastOjbect
{
    return ^() {
        [self removeLastObject];
        return self;
    };
}

- (NSMutableArray *(^)(id object))removeObject
{
    return ^(id object) {
        if (object && [self containsObject:object])
        {
            [self removeObject:object];
        }
        return self;
    };
}

- (NSMutableArray *(^)(NSInteger index))removeObjectAtIndex
{
    return ^(NSInteger index) {
        if (0 <= index || self.count - 1 >= index)
        {
            [self removeObjectAtIndex:index];
        }
        return self;
    };
}

- (NSMutableArray *(^)())removeAllObject
{
    return ^() {
        [self removeAllObjects];
        return self;
    };
}


@end
