//
//  NSString+SYRegular.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SYRegular)

/**
 *  是否是正确的指定正则的格式
 *
 *  @param regex 正则
 *
 *  @return 是，或否
 */
- (BOOL)isValidText:(NSString *)regex;

/**
 *  判断是否正确的移动手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCM;

/**
 *  判断是否正确的联通手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCU;

/**
 *  判断是否正确的电信手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobileCT;

/**
 *  判断是否正确的手机号码格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidMobile;

/**
 *  判断是否正确的电子邮箱格式
 *
 *  @return 是，或否
 */
- (BOOL)isValidEmail;

/**
 *  判断是否含有空格的字符串
 *
 *  @return 是，或否
 */
- (BOOL)isSpaceString;

/**
 *  判断字符串中是否有某个子字符串
 *
 *  @param subString 子字符串
 *
 *  @return 是，或否
 */
- (BOOL)isHasSubString:(NSString *)subString;

/**
 *  判断字符串是是否有中文
 *
 *  @return 是，或否
 */
- (BOOL)isHasChineseString;

/**
 *  判断字符串是否是纯数字字符串
 *
 *  @return 是，或否
 */
- (BOOL)isNumberString;

/// 字符是否只包含"数字、大小写字母、_、@"的用户帐号
- (BOOL)isValidAccount;

/// 字符是否只包含"数字、大小写字母"且为4~12位的有效帐户
- (BOOL)isValidLimitAccount;

/// 字符是否是有效密码（大小写字母、数字组成，8-16位）
- (BOOL)isValidPassword;

/// 字符是否指定金额（100位整数，2位小数）
- (BOOL)isValidMoney;

/// 字符是否是有效的银行卡号（12~19位数字）
- (BOOL)isValidBankCardNumber;

/// 字符是否是合法身份证账号（数字与字母组成）
- (BOOL)isValidIDCard;

/// 字符是否是有效的身份证号码
- (BOOL)isValidIdentityCard;

/// 正则判断
- (BOOL)isValidTextWithPredicate:(NSString *)regex;
#pragma mark - 表情输入限制

/// 包含表情字符
- (BOOL)isEmojiString;

@end
