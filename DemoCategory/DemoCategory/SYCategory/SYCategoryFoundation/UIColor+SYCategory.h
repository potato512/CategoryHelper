//
//  UIColor+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

// 随机颜色
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
// 颜色(RGB)
#define RGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// 利用这种方法设置颜色和透明值，可不影响子视图背景色
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface UIColor (SYCategory)

/**
 *  将十六进制颜色转换为 UIColor 对象
 *
 *  @param color 十六进制颜色
 *
 *  @return UIColor 对象
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

@end
