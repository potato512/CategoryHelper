//
//  UILabel+SYCategory.m
//  DemoCategory
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UILabel+SYCategory.h"

@implementation UILabel (SYCategory)

/**
 *  修改标签信息（文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 */
- (void)labelAttributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont
{
    [self labelAttributedText:string color:textColor font:textFont space:0.0 rowSpace:0.0];
}

/**
 *  修改标签信息（字符间距，行间距，文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 */
- (void)labelAttributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace
{
    NSString *text = self.text;
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:text];
    
    // 设置某写字体的颜色 NSForegroundColorAttributeName
    NSRange range = [text rangeOfString:string];
    if (range.location != NSNotFound)
    {
        // 颜色
        if (textColor)
        {
            [attributed addAttribute:NSForegroundColorAttributeName value:textColor range:range];
        }
        // 字体
        if (textFont)
        {
            [attributed addAttribute:NSFontAttributeName value:textFont range:range];
        }
        // 字符间距
        if (0.0 < characterSpace)
        {
            // 设置每个字体之间的间距 NSKernAttributeName 这个对象所对应的值是一个NSNumber对象(包含小数),作用是修改默认字体之间的距离调整,值为0的话表示字距调整是禁用的
            [attributed addAttribute:NSKernAttributeName value:@(characterSpace) range:range];
        }
        // 行间距
        if (0.0 < rowSpace)
        {
            // 设置每行之间的间距 NSParagraphStyleAttributeName 设置段落的样式
            NSMutableParagraphStyle *par = [[NSMutableParagraphStyle alloc] init];
            [par setLineSpacing:rowSpace];
            [attributed addAttribute:NSParagraphStyleAttributeName value:par range:range];
        }
    }

    // 重置
    self.attributedText = attributed;
}

/// 设置自适应标签宽高
- (void)labelAutoSize:(SYLabelAutoSizeType)type
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize size = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize labelsize = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:self.lineBreakMode];
    if (SYLabelAutoSizeTypeHorizontal == type)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, self.frame.size.height);
    }
    else if (SYLabelAutoSizeTypeAll == type)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, labelsize.height);
    }
}

@end
