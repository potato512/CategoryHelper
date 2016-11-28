//
//  NSAttributedString+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "NSAttributedString+SYCategory.h"

@implementation NSAttributedString (SYCategory)

// 改变字体属性（颜色及大小）
- (void)attributedText:(NSString *)aString font:(UIFont *)aFont color:(UIColor *)aColor
{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithAttributedString:self];
    if ((attString && 0 != attString.length) && (aString && 0 != aString.length))
    {
        NSString *oldString = [attString string];
        NSRange range = [oldString rangeOfString:aString];
        if (aColor)
        {
            // 颜色
            [attString addAttribute:NSForegroundColorAttributeName
                              value:aColor
                              range:range];
        }
        if (aFont)
        {
            // 字体
            [attString addAttribute:NSFontAttributeName
                              value:aFont
                              range:range];
        }
    }
}

@end
