//
//  NSMutableString+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2017/7/6.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "NSMutableString+SYCategory.h"

@implementation NSMutableString (SYCategory)


#pragma mark - 链式属性

- (NSMutableString *(^)(NSString *string))setString
{
    return ^(NSString *string) {
        if (string)
        {
            [self setString:string];
        }
        return self;
    };
}

- (NSMutableString *(^)(NSString *string))addString
{
    return ^(NSString *string) {
        if (string)
        {
            [self appendString:string];
        }
        return self;
    };
}

- (NSMutableString *(^)(NSString *string, NSUInteger index))addStringAtIndex
{
    return ^(NSString *string, NSUInteger index) {
        if (string && (0 <= index || self.length - 1 >= index))
        {
            [self insertString:string atIndex:index];
        }
        return self;
    };
}

- (NSMutableString *(^)(NSString *currentString, NSString *replaceString))replaceStringForString
{
    return ^(NSString *currentString, NSString *replaceString) {
        if (currentString && replaceString)
        {
            NSString *tmp = [NSString stringWithString:self];
            tmp = [tmp stringByReplacingOccurrencesOfString:currentString withString:replaceString];
            [self setString:tmp];
        }
        return self;
    };
}

- (NSMutableString *(^)(NSString *string, NSRange range))replaceStringForRange
{
    return ^(NSString *string, NSRange range) {
        if (string)
        {
            [self replaceCharactersInRange:range withString:string];
        }
        
        return self;
    };
}


- (NSMutableString *(^)(NSString *string))deleteString
{
    return ^(NSString *string) {
        if (string)
        {
            NSRange range = [self rangeOfString:string];
            if (range.location != NSNotFound)
            {
                [self deleteCharactersInRange:range];
            }
        }
        return self;
    };
}


@end
