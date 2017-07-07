//
//  NSMutableArray+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (SYCategory)

#pragma mark - 链式属性

/// 链式编程 追加元素
- (NSMutableArray *(^)(id object))addObject;

/// 链式编程 添加元素到指定位置
- (NSMutableArray *(^)(id object, NSInteger index))addObjectAtIndex;

/// 链式编程 替换指定位置的元素
- (NSMutableArray *(^)(id object, NSInteger index))setOjbectAtIndex;

/// 链式编程 追加数组
- (NSMutableArray *(^)(NSArray *array))addArray;

/// 链式编程 替换指定位置的元素
- (NSMutableArray *(^)(id object, NSInteger index))replaceObjectAtIndex;

/// 链式编程 删除第一个元素
- (NSMutableArray *(^)())removeTheFirstObject;

/// 链式编程 删除最后一个元素
- (NSMutableArray *(^)())removeTheLastOjbect;

/// 链式编程 删除指定元素
- (NSMutableArray *(^)(id object))removeObject;

/// 链式编程 删除指定位置的元素
- (NSMutableArray *(^)(NSInteger index))removeObjectAtIndex;

/// 链式编程 删除所有元素
- (NSMutableArray *(^)())removeAllObject;

@end
