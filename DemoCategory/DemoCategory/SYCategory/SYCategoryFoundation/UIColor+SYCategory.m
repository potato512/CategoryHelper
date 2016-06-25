//
//  UIColor+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIColor+SYCategory.h"

@implementation UIColor (SYCategory)

/**
 *  将十六进制颜色转换为 UIColor 对象
 *
 *  @param color 十六进制颜色
 *
 *  @return UIColor 对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color
{
    NSString *colorString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if (6 > colorString.length)
    {
        return [UIColor clearColor];
    }
    
    if ([colorString hasPrefix:@"OX"])
    {
        colorString = [colorString substringFromIndex:2];
    }
    if ([colorString hasPrefix:@"#"])
    {
        colorString = [colorString substringFromIndex:1];
    }
    if (6 != colorString.length)
    {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *redString = [colorString substringWithRange:range];
    range.location = 2;
    NSString *greenString = [colorString substringWithRange:range];
    range.location = 4;
    NSString *blueString = [colorString substringWithRange:range];
    
    unsigned int red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
    UIColor *result = [UIColor colorWithRed:((float)(red) / 255.0) green:((float)(green) / 255.0) blue:((float)(blue) / 255.0) alpha:1.0];
    return result;
}

@end
