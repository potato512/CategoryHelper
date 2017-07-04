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
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:self.text];
    attributed = [attributed attributedText:string color:textColor font:textFont space:characterSpace rowSpace:rowSpace bgColor:nil];
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

+ (UILabel *)newUILabel:(void (^)(UILabel *))newlabel
{
    UILabel *label = [[UILabel alloc] init];
    newlabel(label);
    return label;
}

- (UILabel *(^)(CGRect))labelFrame
{
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UILabel *(^)(UIView *))labelSuperview
{
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UILabel *(^)(UIFont *))labelFont
{
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(UIColor *))labelColor
{
    return ^(UIColor *textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))labelAlignment
{
    return ^(NSTextAlignment alignment) {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSString *))labelText
{
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(UIColor *))labelBackgroundColor
{
   return ^(UIColor *color) {
       self.backgroundColor = color;
       return self;
   };
}

@end
