//
//  NSMutableString+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (SYCategory)

#pragma mark - 链式属性

/// 链式编程 重置可变字符串
- (NSMutableString *(^)(NSString *string))resetString;

/// 链式编程 追加字符串
- (NSMutableString *(^)(NSString *string))addString;

/// 链式编程 添加字符串到指定位置
- (NSMutableString *(^)(NSString *string, NSUInteger index))addStringAtIndex;

/// 链式编程 替换指定的字符串
- (NSMutableString *(^)(NSString *currentString, NSString *replaceString))replaceStringForString;

/// 链式编程 替换指定位置的字符串
- (NSMutableString *(^)(NSString *string, NSRange range))replaceStringForRange;

/// 链式编程 删除字符串
- (NSMutableString *(^)(NSString *string))deleteString;

@end
