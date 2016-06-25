//
//  NSString+SYRegular.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSString+SYRegular.h"

@implementation NSString (SYRegular)

/**
 *  是否是正确的指定正则的格式
 *
 *  @param regex 正则
 *
 *  @return 是，或否
 */
- (BOOL)isValidText:(NSString *)regex
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isValid = [predicate evaluateWithObject:self];
    
    return isValid;
}

/**
 *  判断是否正确的移动手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCM
{
    // 替换空格
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (11 != result.length)
    {
        return NO;
    }
    else
    {
        // 移动号码正则
        NSString *regex = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        BOOL isValid = [result isValidText:regex];
        
        return isValid;
    }
}

/**
 *  判断是否正确的联通手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCU
{
    // 替换空格
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (11 != result.length)
    {
        return NO;
    }
    else
    {
        // 联通号码正则
        NSString *regex = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5-6]))\\d{8}|(1709)\\d{7}$";
        BOOL isValid = [result isValidText:regex];
        
        return isValid;
    }
}

/**
 *  判断是否正确的电信手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCT
{
    // 替换空格
    NSString *result = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (11 != result.length)
    {
        return NO;
    }
    else
    {
        // 电信号码正则
        NSString *regex = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        BOOL isValid = [result isValidText:regex];
        
        return isValid;
    }
}

/**
 *  判断是否正确的手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobile
{
    BOOL isCM = [self isValidMobileCM];;
    BOOL isCU = [self isValidMobileCT];
    BOOL isCT = [self isValidMobileCU];
    
    if (isCM || isCU || isCT)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

/**
 *  判断是否正确的电子邮箱格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9._]+\\.[A-Za-z]{2,4}";
    BOOL isValid = [self isValidText:regex];
    
    return isValid;
}

/**
 *  判断是否含有空格的字符串
 *
 *  @return 是，或否
 */
- (BOOL)isSpaceString
{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

/**
 *  判断字符串中是否有某个子字符串
 *
 *  @param subString 子字符串
 *
 *  @return 是，或否
 */
- (BOOL)isHasSubString:(NSString *)subString
{
    NSRange range = [self rangeOfString:subString];
    if (range.location != NSNotFound)
    {
        return YES;
    }
    
    return NO;
}

/**
 *  判断字符串是是否有中文
 *
 *  @return 是，或否
 */
- (BOOL)isHasChineseString
{
    for (NSInteger i = 0; i < self.length; i++)
    {
        int a = [self characterAtIndex:i];
        if (a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    
    return NO;
}

/**
 *  判断字符串是否是纯数字字符串
 *
 *  @return 是，或否
 */
- (BOOL)isNumberString
{
    unichar c;
    for (int i = 0; i < self.length; i++)
    {
        c = [self characterAtIndex:i];
        if (!isdigit(c))
        {
            return NO;
        }
    }
    
    return YES;
}

@end
