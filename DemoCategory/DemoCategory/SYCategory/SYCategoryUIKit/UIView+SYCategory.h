//
//  UIView+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYCategory)

/// 坐标
@property CGPoint origin;

/// 大小
@property CGSize size;

/// 底部左侧，即x，y坐标
@property (readonly) CGPoint bottomLeft;

/// 底部右侧，即x，y坐标
@property (readonly) CGPoint bottomRight;

/// 顶端右侧，即x，y坐标
@property (readonly) CGPoint topRight;

/// 高
@property CGFloat height;

/// 宽
@property CGFloat width;

/// 顶部，即y坐标
@property CGFloat top;

/// 左侧，即x坐标
@property CGFloat left;

/// 底部，即y坐标
@property CGFloat bottom;

/// 右侧，即x坐标
@property CGFloat right;

/**
 *  行玻璃效果（即实时模糊效果）
 *
 *  @param frame 坐标大小
 *
 *  @return UIVisualEffectView
 */
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame;

/// 设置UI视图的边框属性
- (void)layerWithRadius:(CGFloat)radius borderColor:(UIColor *)color borderWidth:(CGFloat)width;

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

@end