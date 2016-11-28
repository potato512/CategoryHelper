//
//  NSAttributedString+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (SYCategory)

// 改变字体属性（颜色及大小）
- (void)attributedText:(NSString *)aString font:(UIFont *)aFont color:(UIColor *)aColor;

@end

/*
 使用coretext改变字体属性
 步骤1 导入框架CoreText.framework
 
 步骤2 导入头文件 #import <CoreText/CoreText.h>
 
 步骤3 将NSString转变成NSMutableAttributedString，根据要设置的字符串属性进行设置
 // 区域
 NSString *oldString = [attString string];
 NSRange range = [oldString rangeOfString:aString];
 // 颜色
 [attString addAttribute:NSForegroundColorAttributeName value:aColor range:range];
 // 字体
 [attString addAttribute:NSFontAttributeName value:aFont range:range];
 
 */