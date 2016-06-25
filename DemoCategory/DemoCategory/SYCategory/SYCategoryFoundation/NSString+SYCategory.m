//
//  NSString+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSString+SYCategory.h"

@implementation NSString (SYCategory)

/**
 *  获取字符串首字母（含汉字）
 *
 *  @return 字符串首字母
 */
- (NSString *)firstCharacter
{
    NSMutableString *string = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *result = [string capitalizedString];
    result = [result substringToIndex:1];
    
    return result;
}

/**
 *  过滤指定字符
 *
 *  @param filterText 特殊字符
 *
 *  @return 过滤特殊字符后的新字符串
 */
- (NSString *)filterWithCharacters:(NSString *)filterText
{
    // 定义一个特殊字符的集合
    NSCharacterSet *filterSet = [NSCharacterSet characterSetWithCharactersInString:filterText];
    // 过滤字符串的特殊字符
    NSString *result = [self stringByTrimmingCharactersInSet:filterSet];
    
    return result;
}

@end
