//
//  NSUserDefaults+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SYCategory)

/// 保存信息
+ (void)saveUserDefault:(id)object key:(NSString *)key;

/// 读取保存的信息
+ (NSDictionary *)getUserDefaultWithKey:(NSString *)key;

/// 删除保存的信息
+ (void)deleteUserDefaultWithKey:(NSString *)key;

@end
