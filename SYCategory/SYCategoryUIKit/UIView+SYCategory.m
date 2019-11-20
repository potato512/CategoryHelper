//
//  UIView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIView+SYCategory.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) UILabel *viewTextLabel;
@property (nonatomic, strong) UIPanGestureRecognizer *panRecognizer;

@property (nonatomic, strong) CAShapeLayer *border;

@end

@implementation UIView (SYCategory)

#pragma mark - 原点尺寸

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


// 移动到指定位置（中心点位置改变）
- (void)moveToPoint:(CGPoint)point
{
    CGPoint newcenter = self.center;
    newcenter.x += point.x;
    newcenter.y += point.y;
    self.center = newcenter;
}

// 变换大小（宽高改变）
- (void)scaleToSize:(CGFloat)scale
{
    CGRect newframe = self.frame;
    newframe.size.width *= scale;
    newframe.size.height *= scale;
    self.frame = newframe;
}

-(void)layoutAlignRightInSuperView:(UIView *)superView marginRight:(float)margin{
    CGRect viewBounds = self.bounds;
    CGRect superBounds = superView.bounds;
    float orignX = CGRectGetMaxX(superBounds) - CGRectGetMaxX(viewBounds)-margin;
    CGRect viewFrame = CGRectMake(orignX, self.frame.origin.y, CGRectGetMaxX(viewBounds), CGRectGetMaxY(viewBounds));
    self.frame = viewFrame;
    
}
-(void)layoutAlignLeftInSuperView:(UIView *)superView marginLeft:(float)margin{
    CGRect viewBounds = self.bounds;
    float orignX = margin;
    CGRect viewFrame = CGRectMake(orignX, self.frame.origin.y, CGRectGetMaxX(viewBounds), CGRectGetMaxY(viewBounds));
    self.frame = viewFrame;
}

-(void)layoutCenterInSuperView:(UIView *)superView{
    CGRect viewFrame = self.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewXPosition = (CGRectGetWidth(superFrame) - CGRectGetWidth(viewFrame)) * 0.5;
    CGFloat viewYPosition = (CGRectGetHeight(superFrame) - CGRectGetHeight(viewFrame))*0.5;
    viewFrame.origin.x = viewXPosition;
    viewFrame.origin.y = viewYPosition;
    self.frame = viewFrame;
}

-(void)layoutCenterVerticalInSuperView:(UIView *)superView{
    CGRect viewFrame = self.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewYPosition = (CGRectGetHeight(superFrame) - CGRectGetHeight(viewFrame))*0.5;
    viewFrame.origin.y = viewYPosition;
    self.frame = viewFrame;
}

-(void)layoutCenterHorizontalInSuperView:(UIView *)superView{
    CGRect viewFrame = self.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewXPosition = (CGRectGetWidth(superFrame) - CGRectGetWidth(viewFrame)) * 0.5;
    viewFrame.origin.x = viewXPosition;
    self.frame = viewFrame;
}

-(void)layoutBottomOfSuperView:(UIView *)superView marginBottm:(CGFloat)margin{
    CGRect viewFrame = self.frame;
    CGRect superFrame = superView.frame;
    CGFloat superHeight = CGRectGetHeight(superFrame);
    CGFloat viewHeight = CGRectGetHeight(viewFrame);
    CGFloat viewYPosition = superHeight - viewHeight - margin;
    viewFrame.origin.y = viewYPosition;
    self.frame = viewFrame;
}


#pragma mark - drapEnable

/************************************************/

- (void)setDrapEnable:(BOOL)drapEnable
{
    objc_setAssociatedObject(self, @selector(drapEnable), @(drapEnable), OBJC_ASSOCIATION_ASSIGN);
    if (drapEnable)
    {
        // 添加拖动手势
        if (self.panRecognizer == nil)
        {
            self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panRecognizerAction:)];
        }
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:self.panRecognizer];
        if (self.superview)
        {
            [self.superview bringSubviewToFront:self];
        }
    }
    else
    {
        // 移动拖动手势
        [self removeGestureRecognizer:self.panRecognizer];
    }
}

- (BOOL)drapEnable
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(drapEnable));
    return number.boolValue;
}

- (void)setPanRecognizer:(UIPanGestureRecognizer *)panRecognizer
{
    objc_setAssociatedObject(self, @selector(panRecognizer), panRecognizer, OBJC_ASSOCIATION_RETAIN);
}

- (UIPanGestureRecognizer *)panRecognizer
{
    return objc_getAssociatedObject(self, @selector(panRecognizer));
}

// 拖动手势方法
- (void)panRecognizerAction:(UIPanGestureRecognizer *)recognizer
{
    // 拖动视图
    UIView *view = (UIView *)recognizer.view;
    
    CGPoint translation = [recognizer translationInView:view.superview];
    CGFloat centerX = view.center.x + translation.x;
    if (centerX < view.width / 2)
    {
        centerX = view.width / 2;
    }
    else if (centerX > view.superview.width - view.width / 2)
    {
        centerX = view.superview.width - view.width / 2;
    }
    CGFloat centerY = view.center.y + translation.y;
    if (centerY < (view.height / 2))
    {
        centerY = (view.height / 2);
    }
    else if (centerY > view.superview.height - view.height / 2)
    {
        centerY = view.superview.height - view.height / 2;
    }
    view.center = CGPointMake(centerX, centerY);
    [recognizer setTranslation:CGPointZero inView:view];
}

/************************************************/

#pragma mark - 标题属性

- (void)setViewText:(NSString *)viewText
{
    objc_setAssociatedObject(self, @selector(viewText), viewText, OBJC_ASSOCIATION_RETAIN);
        
    [self refreshLabel];
    self.viewTextLabel.text = self.viewText;
}

- (NSString *)viewText
{
    NSString *viewText = objc_getAssociatedObject(self, @selector(viewText));
    return viewText;
}

- (void)setViewTextColor:(UIColor *)viewTextColor
{
    objc_setAssociatedObject(self, @selector(viewTextColor), viewTextColor, OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.textColor = self.viewTextColor;
}

- (UIColor *)viewTextColor
{
    UIColor *color = objc_getAssociatedObject(self, @selector(viewTextColor));
    return color;
}

- (void)setViewTextFont:(UIFont *)viewTextFont
{
    objc_setAssociatedObject(self, @selector(viewTextFont), viewTextFont, OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.font = self.viewTextFont;
}

- (UIFont *)viewTextFont
{
    UIFont *font = objc_getAssociatedObject(self, @selector(viewTextFont));
    return font;
}

- (void)setViewTextNumberLines:(NSInteger)viewTextNumberLines
{
    objc_setAssociatedObject(self, @selector(viewTextNumberLines), @(viewTextNumberLines), OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.numberOfLines = self.viewTextNumberLines;
}

- (NSInteger)viewTextNumberLines
{
    NSNumber *numberLines = objc_getAssociatedObject(self, @selector(viewTextNumberLines));
    return numberLines.integerValue;
}

- (void)setViewTextAdjustsFontSizeToFitWidth:(BOOL)viewTextAdjustsFontSizeToFitWidth
{
    objc_setAssociatedObject(self, @selector(viewTextAdjustsFontSizeToFitWidth), @(viewTextAdjustsFontSizeToFitWidth), OBJC_ASSOCIATION_RETAIN);
    
    [self refreshLabel];
    self.viewTextLabel.adjustsFontSizeToFitWidth = self.viewTextAdjustsFontSizeToFitWidth;
}

- (BOOL)viewTextAdjustsFontSizeToFitWidth
{
    NSNumber *adjust = objc_getAssociatedObject(self, @selector(viewTextAdjustsFontSizeToFitWidth));
    return adjust.boolValue;
}

- (void)setViewTextLabel:(UILabel *)viewTextLabel
{
    objc_setAssociatedObject(self, @selector(viewTextLabel), viewTextLabel, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)viewTextLabel
{
    UILabel *label = objc_getAssociatedObject(self, @selector(viewTextLabel));
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

#pragma mark - 视图属性设置

/**
 *  毛玻璃效果（注意使用前必须先添加到父视图）
 *
 *  @param alpha 透明度
 */
- (void)effectViewWithAlpha:(CGFloat)alpha
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.bounds;
    effectView.alpha = alpha;

    [self addSubview:effectView];
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

- (void)setBorder:(CAShapeLayer *)border
{
    objc_setAssociatedObject(self, @selector(border), border, OBJC_ASSOCIATION_RETAIN);
}

- (CAShapeLayer *)border
{
    return objc_getAssociatedObject(self, @selector(border));
}

- (void)resetShapeLayer
{
    if (self.border == nil)
    {
        self.border = [CAShapeLayer layer];
        // 填充颜色
        self.border.fillColor = nil;
        // 添加到父视图
        [self.layer addSublayer:self.border];
        // 路径
        self.border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:0.0].CGPath;
    }
}

/// 设置UI视图的shape边框属性
- (void)shapeLayerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width isDotted:(BOOL)isDotted
{
    if (radius > 0.0)
    {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    
    if (color && width > 0.0)
    {
        [self resetShapeLayer];
        // 线条颜色
        self.border.strokeColor = color.CGColor;
        // 路径
        self.border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius].CGPath;
        // 位置大小
        self.border.frame = self.bounds;
        // 不要设太大 不然看不出效果
        self.border.lineWidth = width;
        // 第一个是线条长度，第二个是间距；nil时为实线
        self.border.lineDashPattern = (isDotted ? @[@9, @4] : nil);
    }
}

- (void)setShapeCornerRadius:(CGFloat)shapeCornerRadius
{
    objc_setAssociatedObject(self, @selector(shapeCornerRadius), @(shapeCornerRadius), OBJC_ASSOCIATION_ASSIGN);
    
    self.layer.cornerRadius = shapeCornerRadius;
    self.layer.masksToBounds = YES;
    [self resetShapeLayer];
    self.border.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:shapeCornerRadius].CGPath;
}

- (CGFloat)shapeCornerRadius
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(shapeCornerRadius));
    return number.floatValue;
}

- (void)setShapeBorderColor:(UIColor *)shapeBorderColor
{
    objc_setAssociatedObject(self, @selector(shapeBorderColor), shapeBorderColor, OBJC_ASSOCIATION_ASSIGN);
    
    [self resetShapeLayer];
    self.border.strokeColor = shapeBorderColor.CGColor;
}

- (UIColor *)shapeBorderColor
{
    return objc_getAssociatedObject(self, @selector(shapeBorderColor));
}

- (void)setShapeBorderWidth:(CGFloat)shapeBorderWidth
{
    objc_setAssociatedObject(self, @selector(shapeBorderWidth), @(shapeBorderWidth), OBJC_ASSOCIATION_ASSIGN);
    
    [self resetShapeLayer];
    self.border.lineWidth = shapeBorderWidth;
}

- (CGFloat)shapeBorderWidth
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(shapeBorderWidth));
    return number.floatValue;
}

- (void)setShapeBorderDotted:(BOOL)shapeBorderDotted
{
    objc_setAssociatedObject(self, @selector(shapeBorderDotted), @(shapeBorderDotted), OBJC_ASSOCIATION_ASSIGN);
    
    [self resetShapeLayer];
    // 第一个是线条长度，第二个是间距；nil时为实线
    self.border.lineDashPattern = (shapeBorderDotted ? @[@9, @4] : nil);
}

- (BOOL)shapeBorderDotted
{
    NSNumber *number = objc_getAssociatedObject(self, @selector(shapeBorderDotted));
    return number.boolValue;
}



// 旋转
- (void)viewTransformWithRotation:(CGFloat)rotation
{
    // 旋转180度 M_PI
    self.transform = CGAffineTransformMakeRotation(rotation);
}

// 缩放
- (void)viewScaleWithSize:(CGFloat)size
{
    self.transform = CGAffineTransformScale(self.transform, size, size);
}

// 水平，或垂直翻转
- (void)viewFlipType:(ViewFlipType)type
{
    if (ViewFlipTypeHorizontal == type)
    {
        self.transform = CGAffineTransformScale(self.transform, -1.0, 1.0);
    }
    else if (ViewFlipTypeVertical == type)
    {
        self.transform = CGAffineTransformScale(self.transform, 1.0, -1.0);
    }
}

#pragma mark - 线条样式

/// 绘制虚线（线宽、间距、颜色）
- (void)drawDashLine:(int)lineWidth space:(int)lineSpacing color:(UIColor *)lineColor
{
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = self.bounds;
    lineLayer.position = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame));
    lineLayer.fillColor = UIColor.clearColor.CGColor;
    lineLayer.strokeColor = lineColor.CGColor;
    lineLayer.lineWidth = CGRectGetHeight(self.frame);
    lineLayer.lineJoin = kCALineJoinRound;
    lineLayer.lineDashPattern = @[[NSNumber numberWithInt:lineWidth], [NSNumber numberWithInt:lineSpacing]];
    // 设置路径
    CGMutablePathRef linePath = CGPathCreateMutable();
    CGPathMoveToPoint(linePath, NULL, 0, 0);
    CGPathAddLineToPoint(linePath, NULL, CGRectGetWidth(self.frame), 0);
    lineLayer.path = linePath;
    CGPathRelease(linePath);
    // 把绘制好的虚线添加上来
    [self.layer addSublayer:lineLayer];
}

#pragma mark - 阴影效果

/// 阴影效果（阴影颜色，透明度，偏移量，是否周边阴影）
- (void)drawShadow:(UIColor *)shadowColor alpha:(CGFloat)alpha offset:(CGSize)size full:(BOOL)isFull
{
    // 阴影颜色
    self.layer.shadowColor = shadowColor.CGColor;
    // 阴影偏移量 默认为(0,3)
    self.layer.shadowOffset = size;
    // 阴影透明度
    self.layer.shadowOpacity = alpha;
    // 周边
    if (isFull) {
        self.layer.shadowOffset = CGSizeMake(0, 0);
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(-4, -4, 100 + 8, 50 + 8)];
        self.layer.shadowPath = shadowPath.CGPath;
    }
}

#pragma mark - 链式属性

/// 链式编程 视图实例化
+ (UIView *)newUIView:(void (^)(UIView *view))complete
{
    UIView *view = [UIView new];
    complete(view);
    return view;
}

#pragma mark 原点尺寸

/// 链式编程 视图的父视图
- (UIView *(^)(UIView *view))viewSuperView
{
    return ^(UIView *view) {
        if (view)
        {
            [view addSubview:self];
        }
        return self;
    };
}

/// 链式编程 视图的位置大小
- (UIView *(^)(CGRect frame))viewFrame
{
    return ^(CGRect frame) {
        self.frame = frame;
        return self;
    };
}

/// 链式编程 视图的位置
- (UIView *(^)(CGPoint point))viewOrigin
{
    return ^(CGPoint point) {
        CGRect rect = self.frame;
        rect.origin = point;
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的中心
- (UIView *(^)(CGPoint center))viewCenter
{
    return ^(CGPoint center) {
        self.center = center;
        return self;
    };
}

/// 链式编程 视图的大小
- (UIView *(^)(CGSize size))viewSize
{
    return ^(CGSize size) {
        CGRect rect = self.frame;
        rect.size = size;
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的左边距
- (UIView *(^)(CGFloat left))viewLeft
{
    return ^(CGFloat left) {
        CGRect rect = self.frame;
        rect.origin.x = left;
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的顶部边距
- (UIView *(^)(CGFloat top))viewTop
{
    return ^(CGFloat top) {
        CGRect rect = self.frame;
        rect.origin.y = top;
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的左边距
- (UIView *(^)(CGFloat right))viewRight
{
    return ^(CGFloat right) {
        CGRect rect = self.frame;
        rect.origin.x = (right - self.frame.size.width);
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的顶部边距
- (UIView *(^)(CGFloat bottom))viewBottom
{
    return ^(CGFloat bottom) {
        CGRect rect = self.frame;
        rect.origin.y = (bottom - self.frame.size.height);
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的宽
- (UIView *(^)(CGFloat width))viewWidth
{
    return ^(CGFloat width) {
        CGRect rect = self.frame;
        rect.size.width = width;
        self.frame = rect;
        return self;
    };
}

/// 链式编程 视图的高
- (UIView *(^)(CGFloat height))viewHeight
{
    return ^(CGFloat height) {
        CGRect rect = self.frame;
        rect.size.height = height;
        self.frame = rect;
        return self;
    };
}

#pragma mark 变换设置

/// 链式编程 视图移动
- (UIView *(^)(CGPoint point))viewMove
{
    return ^(CGPoint point) {
        CGPoint newcenter = self.center;
        newcenter.x += point.x;
        newcenter.y += point.y;
        self.center = newcenter;
        return self;
    };
}

/// 链式编程 视图旋转
- (UIView *(^)(CGFloat rotation))viewTransformRotation
{
    return ^(CGFloat rotation) {
        self.transform = CGAffineTransformMakeRotation(rotation);
        return self;
    };
}

/// 链式编程 视图缩放
- (UIView *(^)(CGFloat size))viewTransformScale
{
    return ^(CGFloat size) {
        self.transform = CGAffineTransformScale(self.transform, size, size);
        return self;
    };
}

/// 链式编程 视图缩放
- (UIView *(^)(CGFloat scale))viewScale
{
    return ^(CGFloat scale) {
        CGRect newframe = self.frame;
        newframe.size.width *= scale;
        newframe.size.height *= scale;
        self.frame = newframe;
        return self;
    };
}

#pragma mark 模糊

/// 链式编程 视图模糊处理
- (UIView *(^)(CGFloat alpha))viewEffect
{
    return ^(CGFloat alpha) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.frame = self.bounds;
        effectView.alpha = alpha;
        [self addSubview:effectView];
        return self;
    };
}

#pragma mark 边框圆角

/// 链式编程 视图圆角
- (UIView *(^)(CGFloat radius))viewRadius
{
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}

/// 链式编程 视图边框（大小，颜色）
- (UIView *(^)(CGFloat width, UIColor *color))viewBorder
{
    return ^(CGFloat width, UIColor *color) {
        if (color)
        {
            self.layer.borderColor = color.CGColor;
        }
        if (width > 0.0)
        {
            self.layer.borderWidth = width;
        }
        return self;
    };
}

#pragma mark 属性设置

/// 链式编程 视图背景色
- (UIView *(^)(UIColor *color))viewBackgroundColor
{
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

/// 链式编程 视图tag
- (UIView *(^)(NSInteger tag))viewTag
{
    return ^(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

/// 链式编程 视图透明度
- (UIView *(^)(CGFloat alpha))viewAlpha
{
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

/// 链式编程 视图背景色透明度
- (UIView *(^)(UIColor *color, CGFloat alpha))viewColorAlpha
{
    return ^(UIColor *color, CGFloat alpha) {
        if (color)
        {
            self.backgroundColor = [color colorWithAlphaComponent:alpha];
        }
        return self;
    };
}

/// 链式编程 视图是否隐藏
- (UIView *(^)(BOOL hidden))viewHidden
{
    return ^(BOOL hidden) {
        self.hidden = hidden;
        return self;
    };
}

/// 链式编程 视图内容显示模式
- (UIView *(^)(UIViewContentMode mode))viewContentMode
{
    return ^(UIViewContentMode mode) {
        self.contentMode = mode;
        return self;
    };
}

/// 链式编程 视图适配
- (UIView *(^)(UIViewAutoresizing autoresizing))viewAutoresizing
{
    return ^(UIViewAutoresizing autoresizing) {
        self.autoresizingMask = autoresizing;
        return self;
    };
}

/// 链式编程 视图用户交互
- (UIView *(^)(BOOL enable))viewInteractionEnabled
{
    return ^(BOOL enable) {
        self.userInteractionEnabled = enable;
        return self;
    };
}

#pragma mark 文本信息

/// 链式编程 视图标题
- (UIView *(^)(NSString *text))viewTitle
{
    return ^(NSString *text) {
        self.viewText = text;
        return self;
    };
}

/// 链式编程 视图标题颜色
- (UIView *(^)(UIColor *color))viewTitleColor
{
    return ^(UIColor *color) {
        self.viewTextColor = color;
        return self;
    };
}

/// 链式编程 视图标题字体大小
- (UIView *(^)(UIFont *font))viewTitleFont
{
    return ^(UIFont *font) {
        self.viewTextFont = font;
        return self;
    };
}

/// 链式编程 视图标题位置大小
- (UIView *(^)(CGRect frame))viewTitleFrame
{
    return ^(CGRect frame) {
        self.viewTextRect = frame;
        return self;
    };
}

/// 链式编程 视图标题对齐方式
- (UIView *(^)(NSTextAlignment alignment))viewTitleAlignament
{
    return ^(NSTextAlignment alignment) {
        self.viewTextAlignment = alignment;
        return self;
    };
}

/// 链式编程 视图拖动
- (UIView *(^)(BOOL dragEnable))viewDragEnable
{
    return ^(BOOL dragEnable) {
        self.drapEnable = dragEnable;
        return self;
    };
}

@end
