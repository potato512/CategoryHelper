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

@end
