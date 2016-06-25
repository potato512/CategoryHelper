//
//  NSFileManager+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSFileManager+SYCategory.h"

@implementation NSFileManager (SYCategory)

/**
 *  磁盘总空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesAllFiles
{
    CGFloat size = 0.0;
    NSError *error;
    
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error)
    {
        size = 0.0;
        
//#ifdef DEBUG
//        NSLog(@"error=%@",error.localizedDescription);
//#endif
    }
    else
    {
        NSNumber *sizeNumber = [dict objectForKey:NSFileSystemSize];
        size = sizeNumber.floatValue;
    }
    
    return size;
}

/**
 *  磁盘可用空间大小
 *
 *  @return float 字节
 */
+ (CGFloat)sizeBytesFree
{
    CGFloat size = 0.0;
    NSError *error;
    
    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error)
    {
        size = 0.0;
    }
    else
    {
        NSNumber *sizeNumber = [dict objectForKey:NSFileSystemFreeSize];
        size = sizeNumber.floatValue;
    }
    
    return size;
}

/**
 *  指定路径下某个文件的大小
 *
 *  @param filePath 指定路径的文件
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFilePath:(NSString *)filePath
{
    long long size = 0;

    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist)
    {
        NSError *error;
        NSDictionary *dict = [fileManager attributesOfItemAtPath:filePath error:&error];
        if (error)
        {
            size = 0;
        }
        else
        {
            size = [dict fileSize];
        }
    }
    
    return size;
}

/**
 *  指定路径下所有文件的大小
 *
 *  @param fileFolder 指定路径
 *
 *  @return long long 大小
 */
+ (long long)sizeBytesWithFileFolder:(NSString *)fileFolder
{
    long long size = 0;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:fileFolder];
    if (isExist)
    {
        NSArray *fileArray = [fileManager subpathsAtPath:fileFolder];
        NSEnumerator *fileEnumerator = [fileArray objectEnumerator];
        NSString *fileName;
        while ((fileName = [fileEnumerator nextObject]) != nil)
        {
            NSString *filePath = [fileFolder stringByAppendingPathComponent:fileName];
            long long sizeFile = [self sizeBytesWithFilePath:filePath];
            size += sizeFile;
        }
    }
    
    return size;
}

@end
