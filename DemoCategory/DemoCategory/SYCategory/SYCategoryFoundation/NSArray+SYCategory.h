//
//  NSArray+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SYCategory)

/**
 *  字符串数组按照元素首字母进行排序分组
 *
 *  @return 按首字母排序后的数组字典
 */
- (NSDictionary *)dictionaryOrderByCharacter;

@end
