//
//  NSFileManager+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSFileManager (SYCategory)

/**
 *  磁盘总空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesAllFiles;

/**
 *  磁盘可用空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesFree;

/**
 *  指定路径下某个文件的大小
 *
 *  @param filePath 指定路径的文件
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFilePath:(NSString *)filePath;

/**
 *  指定路径下所有文件的大小
 *
 *  @param fileFolder 指定路径
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFileFolder:(NSString *)fileFolder;

@end
