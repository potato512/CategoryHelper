//
//  UILabel+SYCategory.h
//  zhangshaoyu
//
//  Created by herman on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 自适应大小类型（宽高，或宽）
typedef NS_ENUM(NSInteger, SYLabelAutoSizeType)
{
    /// 自适应宽
    SYLabelAutoSizeTypeHorizontal = 1,
    
    /// 自适应宽高
    SYLabelAutoSizeTypeAll
};

@interface UILabel (SYCategory)

/**
 *  修改标签信息（文字大小颜色）
 *
 *  @param string         要修改的文字
 *  @param textColor      要修改的文字颜色
 *  @param textFont       要修改的文字大小
 */
- (void)attributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont;

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
- (void)attributedText:(NSString *)string color:(UIColor *)textColor backColor:(UIColor *)backColor font:(UIFont *)textFont space:(CGFloat)characterSpace rowSpace:(CGFloat)rowSpace;

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
- (void)attributedText:(NSString *)string color:(UIColor *)textColor font:(UIFont *)textFont lineStyle:(BOOL)isDelete lineType:(NSInteger)lineType lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor;


/// 设置自适应标签宽高
- (void)labelAutoSize:(SYLabelAutoSizeType)type;

// 字体发光

// 字体阴影


#pragma mark - 链式属性

/// 链式编程 实例化
+ (UILabel *)newUILabel:(void (^)(UILabel *label))complete;
/// 链式编程 文本字体大小
- (UILabel *(^)(UIFont *font))labelFont;
/// 链式编程 文本颜色
- (UILabel *(^)(UIColor *color))labelColor;
/// 链式编程 文本对方方式
- (UILabel *(^)(NSTextAlignment alignment))labelAlignment;
/// 链式编程 文本
- (UILabel *(^)(NSString *text))labelText;

#pragma mark NSAttributedString

- (UILabel *(^)(NSString *text, UIColor *color, UIColor *backColor, UIFont *font, CGFloat characterSpace, CGFloat rowSpace))labelAttributedText;

/// 线条样式，如下划线单线类型NSUnderlineStyleSingle
- (UILabel *(^)(NSString *text, UIColor *color, UIFont *font, BOOL isDelete, NSInteger lineType, CGFloat lineWidth, UIColor *lineColor))labelAttributedTextlineType;

@end
