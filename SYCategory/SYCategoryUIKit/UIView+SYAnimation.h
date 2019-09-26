//
//  UIView+SYAnimation.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/9/2.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SYAnimation)

#pragma mark - 动画操作

/// 停止动画
- (void)animationStop;

/// 暂停动画
- (void)animationPause;

/// 继续动画
- (void)animaitonReplay;

#pragma mark - 动画特效

/// 旋转动画
- (void)animationRotationWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation;

/// 心跳动画
- (void)animationScaleWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation;

/// 弹簧动画
- (void)animationSpringStart:(CGFloat)start end:(CGFloat)end animation:(BOOL)isAnimation;

/**
 *  CATransition动画效果
 *
 *  @param type 动画效果类型，如：
                 @"cube"                  立方体翻滚效果
                 @"moveIn"                新视图移到旧视图上面
                 @"reveal"                显露效果(将旧视图移开,显示下面的新视图)
                 @"fade"                  交叉淡化过渡(不支持过渡方向)(默认为此效果)
                 @"pageCurl"              向上翻一页
                 @"pageUnCurl"            向下翻一页
                 @"suckEffect"            收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
                 @"rippleEffect"          滴水效果,(不支持过渡方向)
                 @"oglFlip"               上下左右翻转效果
                 @"rotate"                旋转效果
                 @"push"
                 @"cameraIrisHollowOpen"  相机镜头打开效果(不支持过渡方向)
                 @"cameraIrisHollowClose" 相机镜头关上效果(不支持过渡方向)
                 kCATransitionFade        交叉淡化过渡
                 kCATransitionMoveIn      新视图移到旧视图上面
                 kCATransitionPush        新视图把旧视图推出去
                 kCATransitionReveal      将旧视图移开,显示下面的新视图
 *  @param subType 动画效果方向，如：
                     kCATransitionFromRight; 同字面意思(下同)
                     kCATransitionFromLeft;
                     kCATransitionFromTop;
                     kCATransitionFromBottom;
                     当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
                     90cw   逆时针旋转90°
                     90ccw  顺时针旋转90°
                     180cw  逆时针旋转180°
                     180ccw 顺时针旋转180°
 *  @param duration 动画时间
 *  @param funcation 动画函数名，如：
                     kCAMediaTimingFunctionLinear        线性,即匀速
                     kCAMediaTimingFunctionEaseIn        先慢后快
                     kCAMediaTimingFunctionEaseOut       先快后慢
                     kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
                     kCAMediaTimingFunctionDefault       实际效果是动画中间比较快
 */
- (void)animationCATransitionWithDuration:(NSTimeInterval)duration type:(NSString *)type subType:(NSString *)subType funcation:(NSString *)funcation animation:(BOOL)isAnimation;

/**
 *  CABasicAnimation动画
 *
 *  @param path      动画类型
 *  @param duration  动画时间，默认0.3
 *  @param function  动画函数名称kCAMediaTimingFunctionLinear, kCAMediaTimingFunctionEaseIn, kCAMediaTimingFunctionEaseOut, kCAMediaTimingFunctionEaseInEaseOut, kCAMediaTimingFunctionDefault
 *  @param start 起始值
 *  @param end   终点值
 */
- (void)animationCABasicWithDuration:(NSTimeInterval)duration path:(NSString *)path function:(NSString *)function start:(id)start end:(id)end animation:(BOOL)isAnimation;

/**
 *  CAKeyframeAnimation动画
 *
 *  @param view      添加动画效果的UIView
 *  @param keyPath   动画类型
 *  @param values    动画效果Values方式（NSValues）
 *  @param refPath   动画效果path方式
 *  @param duration  动画时间，默认0.3
 *  @param repeat    动画执行次数，默认1
 *  @param isRemoved 动画结束后是否恢复原样
 *  @param function  动画函数名称kCAMediaTimingFunctionLinear,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionDefault
 
 */
- (void)animationCAKeyframeWithDuration:(NSTimeInterval)duration keyPath:(NSString *)keyPath values:(NSArray *)values refPath:(CGPathRef)refPath repeatCount:(NSInteger)repeat removedCompletion:(BOOL)isRemoved timingFunction:(NSString *)function animation:(BOOL)isAnimation;

/*
 * 仿射变幻动画效果
 * 向右旋转45°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80)
 * 从底部向上收缩一半后弹出 CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0)
 * 从底部向上完全收缩后弹出 CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0)
 * 左旋转45°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50)
 * 旋转180°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.1, 0.2, 0.2)
 */
- (void)animationCABasicWithDuration:(NSTimeInterval)duration rotation:(CATransform3D)transform3D repeat:(NSInteger)repeat animation:(BOOL)isAnimation;


/// 火焰动画
- (void)animationFireWithImage:(NSString *)imageName frame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
