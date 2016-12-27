//
//  NSString+SYMD5.h
//  DemoCategory
//
//  Created by herman on 2016/12/18.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SYMD5)

/**
*  字符串MD5加密（区分32位，或16位大小写，同时可加盐）
*
*  @param is32Bit     是32位，还是16位
*  @param isUppercase 是大写，还是小写
*  @param salt        盐值
*
*  @return NSString
*/
- (NSString *)MD5With32Bit:(BOOL)is32Bit uppercase:(BOOL)isUppercase salt:(NSString *)salt;

/**
 *  文件转换成MD5值
 *
 *  @param NSString 文字路径
 *
 *  @return NSString
 */
+ (NSString *)MD5WithFilePath:(NSString *)path;

@end
