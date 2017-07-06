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

- (NSMutableString *(^)(NSString *string))setString;

- (NSMutableString *(^)(NSString *string))addString;

- (NSMutableString *(^)(NSString *string, NSUInteger index))addStringAtIndex;

- (NSMutableString *(^)(NSString *currentString, NSString *replaceString))replaceStringForString;

- (NSMutableString *(^)(NSString *string, NSRange range))replaceStringForRange;


- (NSMutableString *(^)(NSString *string))deleteString;


@end
