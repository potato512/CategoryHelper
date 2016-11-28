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
 *  修改标签信息
 *
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 *  @param string         要修改的文字
 *  @param color          要修改的文字颜色
 */
- (void)labelAdjust:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace text:(NSString *)string color:(UIColor *)color
{
    NSString *text = self.text;
    
    // 设置每个字体之间的间距 NSKernAttributeName 这个对象所对应的值是一个NSNumber对象(包含小数),作用是修改默认字体之间的距离调整,值为0的话表示字距调整是禁用的;
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSKernAttributeName:@(characterSpace)}];
    
    // 设置某写字体的颜色 NSForegroundColorAttributeName
    NSRange range = [text rangeOfString:string];
    if (range.location != NSNotFound)
    {
        [attributed addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    // 设置每行之间的间距 NSParagraphStyleAttributeName 设置段落的样式
    NSMutableParagraphStyle *par = [[NSMutableParagraphStyle alloc] init];
    [par setLineSpacing:rowSpace];
   
    // 为某一范围内文字添加某个属性 NSMakeRange表示所要的范围,从0到整个文本的长度
    [attributed addAttribute:NSParagraphStyleAttributeName value:par range:NSMakeRange(0, text.length)];
    
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
