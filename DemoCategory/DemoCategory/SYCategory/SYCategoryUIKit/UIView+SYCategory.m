//
//  UIView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIView+SYCategory.h"
#import "UIGestureRecognizer+SYCategory.h"
#import <objc/runtime.h>

static NSString *const keyViewText = @"viewText";
static NSString *const keyViewTextColor = @"viewTextColor";
static NSString *const keyViewTextFont = @"viewTextFont";
static NSString *const keyViewTextLabel = @"viewTextLabel";

@interface UIView ()

@property (nonatomic, strong) UILabel *viewTextLabel;

@end

@implementation UIView (SYCategory)

#pragma mark - setter/getter

- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGPoint)bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setTop:(CGFloat)top
{
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setLeft:(CGFloat)left
{
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect rect = self.frame;
    rect.origin.y = bottom - self.frame.size.height;
    self.frame = rect;
}

- (CGFloat)bottom
{
    return (self.frame.origin.y + self.frame.size.height);
}

- (void)setRight:(CGFloat)right
{
    CGRect rect = self.frame;
    rect.origin.x = right - self.frame.size.width;
    self.frame = rect;
}

- (CGFloat)right
{
    return (self.frame.origin.x + self.frame.size.width);
}

#pragma mark - 添加标题设置

- (void)setViewText:(NSString *)viewText
{
    if (0 < viewText.length)
    {
        objc_setAssociatedObject(self, &keyViewText, viewText, OBJC_ASSOCIATION_RETAIN);
        
        [self refreshLabel];
        self.viewTextLabel.text = self.viewText;
    }
}

- (NSString *)viewText
{
    NSString *viewText = objc_getAssociatedObject(self, &keyViewText);
    return viewText;
}

- (void)setViewTextColor:(UIColor *)viewTextColor
{
    objc_setAssociatedObject(self, &keyViewTextColor, viewTextColor, OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.textColor = self.viewTextColor;
}

- (UIColor *)viewTextColor
{
    UIColor *color = objc_getAssociatedObject(self, &keyViewTextColor);
    return color;
}

- (void)setViewTextFont:(UIFont *)viewTextFont
{
    objc_setAssociatedObject(self, &keyViewTextFont, viewTextFont, OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.font = self.viewTextFont;
}

- (UIFont *)viewTextFont
{
    UIFont *font = objc_getAssociatedObject(self, &keyViewTextFont);
    return font;
}

- (void)setViewTextLabel:(UILabel *)viewTextLabel
{
    objc_setAssociatedObject(self, &keyViewTextLabel, viewTextLabel, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)viewTextLabel
{
    UILabel *label = objc_getAssociatedObject(self, &keyViewTextLabel);
    return label;
}

- (void)refreshLabel
{
    if (self.viewTextLabel == nil)
    {
        self.viewTextLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.viewTextLabel];
        self.viewTextLabel.backgroundColor = [UIColor clearColor];
        self.viewTextLabel.numberOfLines = 0;
        self.viewTextLabel.textColor = [UIColor blackColor];
        self.viewTextLabel.font = [UIFont systemFontOfSize:12.0];
        self.viewTextLabel.textAlignment = NSTextAlignmentCenter;
    }
}

- (void)setViewTextRect:(CGRect)viewTextRect
{
    self.viewTextLabel.frame = viewTextRect;
}

- (CGRect)viewTextRect
{
    return self.viewTextLabel.frame;
}

- (void)setViewTextAlignment:(NSTextAlignment)viewTextAlignment
{
    self.viewTextLabel.textAlignment = viewTextAlignment;
}

- (NSTextAlignment)viewTextAlignment
{
    return self.viewTextLabel.textAlignment;
}

#pragma mark -

/**
 *  毛玻璃效果（注意使用前必须先添加到父视图）
 *
 *  @param alpha 透明度
 */
- (void)effectViewWithAlpha:(CGFloat)alpha
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.frame;
    effectView.alpha = alpha;
    if (self.superview)
    {
        [self.superview addSubview:effectView];
    }
}

/// 设置UI视图的边框属性
- (void)layerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (radius > 0.0)
    {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    
    if (color && width > 0.0)
    {
        self.layer.borderColor = color.CGColor;
        self.layer.borderWidth = width;
    }
}

#pragma mark - 解摸手势

/// 单击，或双击响应
- (void)tapRecognizer:(NSInteger)tapNumber action:(void (^)(UITapGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer tapRecognizer:self tapNumber:tapNumber action:action];
}

/// 长按手势（长按时间默认0.5）
- (void)longPressRecognizer:(CFTimeInterval)time action:(void (^)(UILongPressGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer longPressRecognizer:self minimumPressDuration:time action:action];
}

/// 拖动手势
- (void)panRecognizer:(void (^)(UIPanGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer panRecognizer:self action:action];
}

/// 拿捏手势
- (void)pinchRecognizer:(void (^)(UIPinchGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer pinchRecognizer:self action:action];
}

/// 滑动手势
- (void)swipeRecognizer:(UISwipeGestureRecognizerDirection)direction action:(void (^)(UISwipeGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer swipeRecognizer:self direction:direction action:action];
}

/// 旋转手势
- (void)rotationRecognizer:(void (^)(UIRotationGestureRecognizer *recognizer))action
{
    [UIGestureRecognizer rotationRecognizer:self action:action];
}

@end
