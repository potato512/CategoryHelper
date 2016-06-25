//
//  NSArray+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSArray+SYCategory.h"
#import <UIKit/UIKit.h>
#import "NSString+SYCategory.h"

@implementation NSArray (SYCategory)

/**
 *  字符串数组按照元素首字母进行排序分组
 *
 *  @return 按首字母排序后的数组字典
 */
- (NSDictionary *)dictionaryOrderByCharacter
{
    if (0 == self.count)
    {
        return nil;
    }
    
    for (id obj in self)
    {
        if (![obj isKindOfClass:[NSString class]])
        {
            return nil;
        }
    }
    
    UILocalizedIndexedCollation *indexedCollation = [UILocalizedIndexedCollation currentCollation];
    NSMutableArray *objects = [NSMutableArray arrayWithCapacity:indexedCollation.sectionIndexTitles.count];
    // 创建27个分组数组
    for (int i = 0; i < indexedCollation.sectionIndexTitles.count; i++)
    {
        NSMutableArray *obj = [NSMutableArray array];
        [objects addObject:obj];
    }
    
    // 按字母顺序进行分组
    NSInteger lastIndex = -1;
    for (int i = 0; i < self.count; i++)
    {
        NSInteger index = [indexedCollation sectionForObject:self[i] collationStringSelector:@selector(uppercaseString)];
        [[objects objectAtIndex:index] addObject:self[i]];
        
        lastIndex = index;
    }
    
    // 去掉空数组
    for (int i = 0; i < objects.count; i++)
    {
        NSMutableArray *obj = objects[i];
        if (obj.count == 0)
        {
            [objects removeObject:obj];
        }
    }
    
    // 获取索引字母
    NSMutableArray *keys = [NSMutableArray arrayWithCapacity:objects.count];
    for (NSMutableArray *obj in objects)
    {
        NSString *str = obj[0];
        NSString *key = [str firstCharacter];
        [keys addObject:key];
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:objects forKey:keys];
    
    return dic;
}


@end
