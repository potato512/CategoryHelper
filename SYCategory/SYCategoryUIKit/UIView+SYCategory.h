//
//  UIView+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 翻转视图类型（水平-默认，或垂直）
typedef NS_ENUM(NSInteger, ViewFlipType)
{
    /// 翻转视图类型-水平（默认）
    ViewFlipTypeHorizontal = 0,
    
    /// 翻转视图类型-垂直
    ViewFlipTypeVertical
};

@interface UIView (SYCategory)

#pragma mark - 原点尺寸

/// 坐标
@property (nonatomic, assign) CGPoint origin;

/// 大小
@property (nonatomic, assign) CGSize size;

/// 底部左侧，即x，y坐标
@property (nonatomic, assign, readonly) CGPoint bottomLeft;

/// 底部右侧，即x，y坐标
@property (nonatomic, assign, readonly) CGPoint bottomRight;

/// 顶端右侧，即x，y坐标
@property (nonatomic, assign, readonly) CGPoint topRight;

/// 高
@property (nonatomic, assign) CGFloat height;

/// 宽
@property (nonatomic, assign) CGFloat width;

/// 顶部，即y坐标
@property (nonatomic, assign) CGFloat top;

/// 左侧，即x坐标
@property (nonatomic, assign) CGFloat left;

/// 底部，即y坐标
@property (nonatomic, assign) CGFloat bottom;

/// 右侧，即x坐标
@property (nonatomic, assign) CGFloat right;

/// 移动到指定位置（中心点位置改变）
- (void)moveToPoint:(CGPoint)point;

/// 变换大小（宽高改变）
- (void)scaleToSize:(CGFloat)scale;

#pragma mark - 标题属性

/// 标题（默认无）
@property (nonatomic, strong) NSString *viewText;
/// 标题字体颜色（默认黑色）
@property (nonatomic, strong) UIColor *viewTextColor;
/// 标题字体大小（默认12.0）
@property (nonatomic, strong) UIFont *viewTextFont;
/// 标题显示位置（默认居中）
@property (nonatomic, assign) CGRect viewTextRect;
/// 标题显示对齐方式（默认居中）
@property (nonatomic, assign) NSTextAlignment viewTextAlignment;


#pragma mark - 视图属性设置

/**
 *  毛玻璃效果（注意使用前必须先添加到父视图）
 *
 *  @param alpha 透明度
 */
- (void)effectViewWithAlpha:(CGFloat)alpha;

/// 设置UI视图的边框属性
- (void)layerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width;

/// 旋转
- (void)viewTransformWithRotation:(CGFloat)rotation;

/// 缩放
- (void)viewScaleWithSize:(CGFloat)size;

/// 水平，或垂直翻转
- (void)viewFlipType:(ViewFlipType)type;

#pragma mark - 解摸手势

/// 单击，或双击响应
- (void)tapRecognizer:(NSInteger)tapNumber action:(void (^)(UITapGestureRecognizer *recognizer))action;

/// 长按手势（长按时间默认0.5）
- (void)longPressRecognizer:(CFTimeInterval)time action:(void (^)(UILongPressGestureRecognizer *recognizer))action;

/// 拖动手势
- (void)panRecognizer:(void (^)(UIPanGestureRecognizer *recognizer))action;

/// 拿捏手势
- (void)pinchRecognizer:(void (^)(UIPinchGestureRecognizer *recognizer))action;

/// 滑动手势
- (void)swipeRecognizer:(UISwipeGestureRecognizerDirection)direction action:(void (^)(UISwipeGestureRecognizer *recognizer))action;

/// 旋转手势
- (void)rotationRecognizer:(void (^)(UIRotationGestureRecognizer *recognizer))action;



#pragma mark - 链式属性

+ (UIView *)newUIView:(void (^)(UIView *view))complete;

#pragma mark 原点尺寸

- (UIView *(^)(UIView *view))viewSuperView;

- (UIView *(^)(CGRect frame))viewFrame;

- (UIView *(^)(CGPoint point))viewOrigin;

- (UIView *(^)(CGPoint center))viewCenter;

- (UIView *(^)(CGSize size))viewSize;

- (UIView *(^)(CGFloat left))viewLeft;

- (UIView *(^)(CGFloat top))viewTop;

- (UIView *(^)(CGFloat right))viewRight;

- (UIView *(^)(CGFloat bottom))viewBottom;

- (UIView *(^)(CGFloat width))viewWidth;

- (UIView *(^)(CGFloat height))viewHeight;

#pragma mark 变换设置

- (UIView *(^)(CGPoint point))viewMove;

- (UIView *(^)(CGFloat rotation))viewTransformRotation;

- (UIView *(^)(CGFloat size))viewTransformScale;

- (UIView *(^)(CGFloat scale))viewScale;

#pragma mark 边框圆角

- (UIView *(^)(CGFloat alpha))viewEffect;

#pragma mark 边框圆角

- (UIView *(^)(CGFloat radius))viewRadius;

- (UIView *(^)(CGFloat width, UIColor *color))viewBorder;

#pragma mark 属性设置

- (UIView *(^)(UIColor *color))viewBackgroundColor;

- (UIView *(^)(NSInteger tag))viewTag;

- (UIView *(^)(CGFloat alpha))viewAlpha;

- (UIView *(^)(UIColor *color, CGFloat alpha))viewColorAlpha;

- (UIView *(^)(BOOL hidden))viewHidden;

- (UIView *(^)(UIViewContentMode mode))viewContentMode;

- (UIView *(^)(UIViewAutoresizing autoresizing))viewAutoresizing;

- (UIView *(^)(BOOL enable))viewInteractionEnabled;

#pragma mark 文本信息

- (UIView *(^)(NSString *text))viewTitle;

- (UIView *(^)(UIColor *color))viewTitleColor;

- (UIView *(^)(UIFont *font))viewTitleFont;

- (UIView *(^)(CGRect frame))viewTitleFrame;

- (UIView *(^)(NSTextAlignment alignment))viewTitleAlignament;


@end
