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

- (NSMutableArray *(^)(id object))addObject;

- (NSMutableArray *(^)(id object, NSInteger index))addObjectAtIndex;

- (NSMutableArray *(^)(id object, NSInteger index))setOjbectAtIndex;

- (NSMutableArray *(^)(NSArray *array))addArray;

- (NSMutableArray *(^)(NSArray *array, NSIndexSet *index))addArrayAtIndex;

- (NSMutableArray *(^)(id object, NSInteger index))replaceObjectAtIndex;

- (NSMutableArray *(^)())removeFirstObject;

- (NSMutableArray *(^)())removeLastOjbect;

- (NSMutableArray *(^)(id object))removeObject;

- (NSMutableArray *(^)(NSInteger index))removeObjectAtIndex;

- (NSMutableArray *(^)())removeAllObject;

@end
