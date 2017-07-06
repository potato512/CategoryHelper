//
//  UILabel+SYCategory.m
//  zhangshaoyu
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UILabel+SYCategory.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic, copy) void (^tapBlock)(UITapGestureRecognizer *);


@end

@implementation UILabel (SYCategory)

/**
 *  修改标签信息（文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 */
- (void)attributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont
{
    [self attributedText:string color:textColor backColor:nil font:textFont space:0.0 rowSpace:0.0];
}

/**
 *  修改标签信息（字符间距，行间距，文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param backColor      要修改的文字背景颜色
 *  @param textFont       要修改的文字大小
 *  @param characterSpace 字体间距
 *  @param rowSpace       行间距
 */
- (void)attributedText:(NSString *)string color:(UIColor *)textColor backColor:(UIColor *)backColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace
{
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:self.text];
    attributed = [attributed attributedText:string color:textColor font:textFont space:characterSpace rowSpace:rowSpace bgColor:backColor];
    self.attributedText = attributed;
}

/**
 *  修改标签信息（文字大小颜色，分割线-样式/宽度/大小）
 *
 *  @param string    要修改的文字
 *  @param textColor 要修改的文字颜色
 *  @param textFont  要修改的文字大小
 *  @param isDelete  是否删除线
 *  @param lineType  线条样式，如下划线单线类型NSUnderlineStyleSingle
 *  @param lineWidth 线条宽度
 *  @param lineColor 线条颜色
 */
- (void)attributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont lineStyle:(BOOL)isDelete lineType:(NSInteger)lineType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor
{
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:self.text];
    attributed = [attributed attributedText:string color:textColor font:textFont lineStyle:isDelete lineType:lineType lineWidth:lineWidth lineColor:lineColor];
    self.attributedText = attributed;
}

/// 设置自适应标签宽高
- (void)labelAutoSize:(SYLabelAutoSizeType)type
{
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGSize size = CGSizeMake(self.frame.size.width, CGFLOAT_MAX);
    CGSize labelsize = [self sizeWithText:self.text font:self.font constrainedSize:size];
    if (SYLabelAutoSizeTypeHorizontal == type)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, self.frame.size.height);
    }
    else if (SYLabelAutoSizeTypeAll == type)
    {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, labelsize.width, labelsize.height);
    }
}

#pragma mark - 链式属性

+ (UILabel *)newUILabel:(void (^)(UILabel *label))complete
{
    UILabel *label = [[UILabel alloc] init];
    complete(label);
    return label;
}

- (UILabel *(^)(UIFont *font))labelFont
{
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(UIColor *color))labelColor
{
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment alignment))labelAlignment
{
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSString *text))labelText
{
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

#pragma mark NSAttributedString

- (UILabel *(^)(NSString *text, UIColor *color, UIColor *backColor, UIFont *font, CGFloat characterSpace, CGFloat rowSpace))labelAttributedText
{
    return ^(NSString *text, UIColor *color, UIColor *backColor, UIFont *font, CGFloat characterSpace, CGFloat rowSpace) {
        [self attributedText:text color:color backColor:backColor font:font space:characterSpace rowSpace:rowSpace];
        return self;
    };
}

- (UILabel *(^)(NSString *text, UIColor *color, UIFont *font, BOOL isDelete, NSInteger lineType, CGFloat lineWidth, UIColor *lineColor))labelAttributedTextlineType
{
    return ^(NSString *text, UIColor *color, UIFont *font, BOOL isDelete, NSInteger lineType, CGFloat lineWidth, UIColor *lineColor) {
        [self attributedText:text color:color font:font lineStyle:isDelete lineType:lineType lineWidth:lineWidth lineColor:lineColor];
        return self;
    };
}



@end
