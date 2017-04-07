//
//  UITextView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UITextView+SYCategory.h"
#import <objc/runtime.h>
#import "UILabel+SYCategory.h"

@interface UITextView ()

@property (nonatomic, strong) UILabel *placeholderLabel;

@end

@implementation UITextView (SYCategory)

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - 输入限制长度（通知方法中使用）

/// 限制UITextView输入的长度（不区分中英文字符）
- (void)limitTextViewLength:(NSUInteger)maxLength
{
    NSString *text = self.text;
    NSInteger length = [self textLength:text CNText:NO];
    if (length > maxLength)
    {
        self.text = [text substringToIndex:maxLength];
    }
}

/// 限制UITextView输入的长度（区分中英文字符）
- (void)limitTextViewCNLength:(NSUInteger)maxLength
{
    NSInteger lengthTotal = 0;
    NSInteger lengthText = 0;
    
    NSString *text = self.text;
    for (NSUInteger i = 0; i < text.length; i++)
    {
        unichar textChar = [text characterAtIndex:i];
        NSInteger lengthChar = (isascii(textChar) ? 1 : 2);
        
        lengthTotal++;
        lengthText += lengthChar;
        if (lengthText > maxLength)
        {
            lengthTotal -= (lengthChar == 2 ? 2 : 1);
            break;
        }
    }
    self.text = [text substringToIndex:lengthTotal];
}

/// 判断输入的字符长度 一个汉字算2个字符，是否区分中英文
- (NSUInteger)textLength:(NSString *)text CNText:(BOOL)isCN
{
    NSUInteger asciiLength = 0;
    NSInteger length = text.length;
    for (NSUInteger i = 0; i < length; i++)
    {
        unichar uc = [text characterAtIndex:i];
        asciiLength += (isascii(uc) ? 1 : (isCN ? 2 : 1));
    }
    return asciiLength;
}


#pragma mark - 属性

#pragma mark 占位符

- (void)setPlaceholderLabel:(UILabel *)placeholderLabel
{
    objc_setAssociatedObject(self, @selector(placeholderLabel), placeholderLabel, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    return label;
}

#pragma mark 占位符字符串

- (void)setPlaceHolderText:(NSString *)placeHolderText
{
    objc_setAssociatedObject(self, @selector(placeHolderText), placeHolderText, OBJC_ASSOCIATION_RETAIN);
    
    [self performSelector:@selector(refreshPlaceholderText) withObject:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(placeholderLabelEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
}

- (NSString *)placeHolderText
{
    NSString *string = objc_getAssociatedObject(self, @selector(placeHolderText));
    return string;
}

- (void)setPlaceholderLabelUI
{
    if (self.placeholderLabel == nil)
    {
        self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, (self.frame.size.width - 5.0 * 2), 0.0)];
        [self addSubview:self.placeholderLabel];
        self.placeholderLabel.font = self.font;
        self.placeholderLabel.textColor = [UIColor colorWithWhite:0.3 alpha:0.2];
        self.placeholderLabel.textAlignment = NSTextAlignmentLeft;
    }
}

- (void)refreshPlaceholderText
{
    [self setPlaceholderLabelUI];
    
    self.placeholderLabel.text = self.placeHolderText;
    [self.placeholderLabel labelAutoSize:SYLabelAutoSizeTypeAll];
}

- (void)placeholderLabelEditChanged:(NSNotification *)notification
{
    // 根据输入情况隐藏或显示占位符
    self.placeholderLabel.hidden = (0 >= self.text.length ? NO : YES);
}

#pragma mark 占位符字体

- (void)setPlaceHolderTextFont:(UIFont *)placeHolderTextFont
{
    objc_setAssociatedObject(self, @selector(placeHolderTextFont), placeHolderTextFont, OBJC_ASSOCIATION_RETAIN);
    [self performSelector:@selector(refreshPlaceholderFont) withObject:nil];
}

- (UIFont *)placeHolderTextFont
{
    UIFont *font = objc_getAssociatedObject(self, @selector(placeHolderTextFont));
    return font;
}

- (void)refreshPlaceholderFont
{
    [self setPlaceholderLabelUI];
    
    self.placeholderLabel.font = self.placeHolderTextFont;
}

#pragma mark 占位符字体颜色 

- (void)setPlaceHolderTextColor:(UIColor *)placeHolderTextColor
{
    objc_setAssociatedObject(self, @selector(placeHolderTextColor), placeHolderTextColor, OBJC_ASSOCIATION_RETAIN);
    [self performSelector:@selector(refreshPlaceholderColor) withObject:nil];
}

- (UIColor *)placeHolderTextColor
{
    UIColor *color = objc_getAssociatedObject(self, @selector(placeHolderTextColor));
    return color;
}

- (void)refreshPlaceholderColor
{
    [self setPlaceholderLabelUI];
    
    self.placeholderLabel.textColor = self.placeHolderTextColor;
}

#pragma mark 限制输入长度

- (void)setLimitMaxLength:(NSInteger)limitMaxLength
{
    if (0 < limitMaxLength)
    {
        objc_setAssociatedObject(self, @selector(limitMaxLength), @(limitMaxLength), OBJC_ASSOCIATION_RETAIN);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewLengthEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (NSInteger)limitMaxLength
{
    NSNumber *limitMaxLength = objc_getAssociatedObject(self, @selector(limitMaxLength));
    return limitMaxLength.integerValue;
}

- (void)textViewLengthEditChanged:(NSNotification *)notification
{
    if ([self isFirstResponder])
    {
        NSInteger maxLength = self.limitMaxLength;
        [self limitTextViewLength:maxLength];
    }
}

#pragma mark 限制输入字符

- (void)setLimitText:(NSString *)limitText
{
    if (0 < limitText.length)
    {
        objc_setAssociatedObject(self, @selector(limitText), limitText, OBJC_ASSOCIATION_RETAIN);
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
}

- (NSString *)limitText
{
    NSString *limitText = objc_getAssociatedObject(self, @selector(limitText));
    return limitText;
}

- (void)textViewEditChanged:(NSNotification *)notification
{
    if ([self isFirstResponder])
    {
        [self limitTextField:self.limitText complete:^(NSInteger index) {
            if (0 == index)
            {
                // 第一位且没有输入时
                if (0 == self.text.length)
                {
                    // 还没有输入时
                    self.text = @"";
                }
                else
                {
                    // 已经有输入时
                    self.text = [self.text substringFromIndex:1];
                }
            }
            else
            {
                if (index < self.text.length)
                {
                    // 中间插入限制字符时
                    NSString *textPart1 = [self.text substringToIndex:index];
                    NSString *textPart2 = [self.text substringFromIndex:(index + 1)];
                    self.text = [NSString stringWithFormat:@"%@%@", textPart1, textPart2];
                }
            }
        }];
    }
}

// 输入
- (void)limitTextField:(NSString *)limitStr complete:(void (^)(NSInteger index))complete
{
    NSCharacterSet *limitSet = [NSCharacterSet characterSetWithCharactersInString:limitStr];
    
    NSString *text = self.text;
    NSInteger length = text.length;
    for (int i = 0; i < length; i++)
    {
        NSString *limitChar = [text substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [limitChar rangeOfCharacterFromSet:limitSet];
        if (range.location == NSNotFound)
        {
            if (complete)
            {
                complete(i);
            }
            
            break;
        }
    }
}



@end
