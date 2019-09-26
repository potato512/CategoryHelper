//
//  UIView+SYAnimation.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/9/2.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import "UIView+SYAnimation.h"

@implementation UIView (SYAnimation)

#pragma mark - 动画操作

/// 停止动画
- (void)animationStop
{
    [self.layer removeAllAnimations];
}

/// 暂停动画
- (void)animationPause
{
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = pausedTime;
}

/// 继续动画
- (void)animaitonReplay
{
    CFTimeInterval pausedTime = [self.layer timeOffset];
    self.layer.speed = 1.0;
    self.layer.timeOffset = 0.0;
    self.layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.layer.beginTime = timeSincePause;
}

#pragma mark - 动画特效

/// 旋转动画
- (void)animationRotationWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat:(M_PI * 2.0)];
        rotationAnimation.duration = duration;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = MAXFLOAT;
        [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    } else {
        
    }
}

/// 心跳动画
- (void)animationScaleWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        //
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = duration;
        scaleAnimation.repeatCount = HUGE_VAL;
        scaleAnimation.autoreverses = YES;
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.1];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.9];
        //
        [self.layer addAnimation:scaleAnimation forKey:@"scale"];
    } else {
        
    }
}

/// 弹簧动画
- (void)animationSpringStart:(CGFloat)start end:(CGFloat)end animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
        spring.damping = 5;
        spring.stiffness = 100;
        spring.mass = 1;
        spring.initialVelocity = 0;
        spring.fromValue = @(start);
        spring.toValue = @(end);
        spring.autoreverses = YES;
        spring.repeatCount = MAXFLOAT;
        spring.duration = spring.settlingDuration;
        
        [self.layer addAnimation:spring forKey:spring.keyPath];
    } else {
        
    }
}

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
- (void)animationCATransitionWithDuration:(NSTimeInterval)duration type:(NSString *)type subType:(NSString *)subType funcation:(NSString *)funcation animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        CATransition *animation = [CATransition animation];
        animation.duration = duration;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:funcation];
        animation.fillMode = kCAFillModeForwards;
        animation.type = type;
        animation.subtype = subType;
        
        [self.layer addAnimation:animation forKey:nil];
    } else {
        
    }
}

/**
 *  CABasicAnimation动画
 *
 *  @param path      动画类型
 *  @param duration  动画时间，默认0.3
 *  @param function  动画函数名称kCAMediaTimingFunctionLinear, kCAMediaTimingFunctionEaseIn, kCAMediaTimingFunctionEaseOut, kCAMediaTimingFunctionEaseInEaseOut, kCAMediaTimingFunctionDefault
 *  @param start 起始值
 *  @param end   终点值
 */
- (void)animationCABasicWithDuration:(NSTimeInterval)duration path:(NSString *)path function:(NSString *)function start:(id)start end:(id)end animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        // 旋转：x轴-@"transform.rotation.x",y轴-@"transform.rotation.y",z轴-@"transform.rotation.z"；值设置xxx.toValue = [NSNumber numberWithFloat:22 * M_PI];
        // 移动：@"position"；移值设置xxx.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 480)];
        // 缩放：@"transform.scale"；值设置xxx.toValue = [NSNumber numberWithFloat:2.0];
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:path];
        if (start) {
            animation.fromValue = start;
        }
        if (end) {
            animation.toValue = end;
        }
        animation.duration = (0.0 >= duration ? 0.3 : duration);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:function];
        
        // 动画终了后不返回初始状态
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        
        [self.layer addAnimation:animation forKey:nil];
    } else {
        
    }
}

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
- (void)animationCAKeyframeWithDuration:(NSTimeInterval)duration keyPath:(NSString *)keyPath values:(NSArray *)values refPath:(CGPathRef)refPath repeatCount:(NSInteger)repeat removedCompletion:(BOOL)isRemoved timingFunction:(NSString *)function animation:(BOOL)isAnimation
{
    /*
     围绕x轴翻转 transform.rotation.x
     围绕y轴翻转 transform.rotation.y
     围绕z轴翻转 transform.rotation.z
     x方向缩放 transform.scale.x
     y方向缩放transform.scale.y
     z方向缩放transform.scale.z
     所有方向缩放 transform.scale
     x方向移动 transform.translation.x
     y方向移动 transform.translation.y
     z方向移动 transform.translation.z
     移动 transform.translation
     移动 @"position"
     */
    if (isAnimation) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = keyPath;
        
        if (values && 0 != values.count) {
            animation.values = values;
        }
        if (refPath) {
            animation.path = refPath;
        }
        
        animation.repeatCount = (0 >= repeat ? 1 : repeat);
        animation.removedOnCompletion = isRemoved;
        animation.fillMode = kCAFillModeForwards;
        animation.duration = (0 >= duration ? 0.3 : duration);
        animation.timingFunction = [CAMediaTimingFunction functionWithName:function];
        
        [self.layer addAnimation:animation forKey:nil];
    } else {
        
    }
}

/*
* 仿射变幻动画效果
* 向右旋转45°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.70, 0.40, 0.80)
* 从底部向上收缩一半后弹出 CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0)
* 从底部向上完全收缩后弹出 CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0)
* 左旋转45°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.50, -0.50, 0.50)
* 旋转180°缩小到最小,然后再从小到大推出 CATransform3DMakeRotation(M_PI, 0.1, 0.2, 0.2)
*/
- (void)animationCABasicWithDuration:(NSTimeInterval)duration rotation:(CATransform3D)transform3D repeat:(NSInteger)repeat animation:(BOOL)isAnimation
{
    if (isAnimation) {
        [UIView animateWithDuration:0.35f animations:^{
            self.transform = CGAffineTransformMakeScale(0.001, 0.001);
            
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
            animation.toValue = [NSValue valueWithCATransform3D:transform3D];
            animation.duration = duration;
            animation.repeatCount = repeat;
            [self.layer addAnimation:animation forKey:nil];
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.35f animations:^ {
                self.transform = CGAffineTransformMakeScale(1.0, 1.0);
            }];
        }];
    } else {
        
    }
}


/// 火焰动画
- (void)animationFireWithImage:(NSString *)imageName frame:(CGRect)frame
{
    if ((imageName && 0 != imageName.length) && !CGRectEqualToRect(frame, CGRectZero))
    {
        /// 发射器对象
        CAEmitterLayer *fireEmitter = [[CAEmitterLayer alloc] init];
        // 发射器在xy平面的中心位置
        fireEmitter.emitterPosition = CGPointMake((frame.origin.x + frame.size.width) / 2, (frame.origin.y + frame.size.height) / 2);
        // 发射器的尺寸大小
        fireEmitter.emitterSize = CGSizeMake(frame.size.width, frame.size.height);
        // 发射器的发射模式
        fireEmitter.emitterMode = kCAEmitterLayerOutline;
        // 发射器的形状
        fireEmitter.emitterShape = kCAEmitterLayerPoint;
        // 发射器渲染模式
        fireEmitter.renderMode = kCAEmitterLayerAdditive;
        
        // 发射单元 - 火焰
        CAEmitterCell *fire = [[CAEmitterCell alloc] init];
        // 粒子的创建速率，默认为1/s。
        fire.birthRate = 200.0;
        // 粒子存活时间
        fire.lifetime = 0.2;
        // 粒子的生存时间容差
        fire.lifetimeRange = 0.5;
        fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
        fire.contents = (__bridge id _Nullable)([UIImage imageNamed:imageName].CGImage);
        fire.name = @"fire";
        // 粒子的速度
        fire.velocity = 35.0;
        // 粒子动画的速度容差
        fire.velocityRange = 10.0;
        // 粒子在xy平面的发射角度
        fire.emissionLongitude = (M_PI + M_PI_2);
        // 粒子发射角度的容差
        fire.emissionRange = (M_PI_2);
        // 缩放速度
        fire.scaleSpeed = 0.3;
        // 旋转度
        fire.spin = 0.2;
        
        fireEmitter.emitterCells = @[fire];
        [self.layer addSublayer:fireEmitter];
    }
}


@end
