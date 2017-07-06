//
//  NSMutableDictionary+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (SYCategory)

#pragma mark - 链式属性

- (NSMutableDictionary *(^)(id object, NSString *key))addObject;

- (NSMutableDictionary *(^)(NSString *key))removeOjbectForKey;

- (NSMutableDictionary *(^)())removeAllObject;

@end
