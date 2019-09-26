//
//  UINavigationController+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SYCategory)

/// 导航栏样式设置
- (void)navigationStyleDefault;

/// 导航栏样式设置（自定义背景颜色、字体）
- (void)navigationStyleColor:(UIColor *)backgroundColor textFont:(UIFont *)textFont textColor:(UIColor *)textColor;

/**
 转场动画
 
 @param viewController 下一个视图控制器
 @param animated 是否有动画效果
 @param type 动画效果，如：
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
 @param subtype 动画方向，如：
 kCATransitionFromRight; 同字面意思(下同)
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
 90cw   逆时针旋转90°
 90ccw  顺时针旋转90°
 180cw  逆时针旋转180°
 180ccw 顺时针旋转180°
 @param function 动画节奏，如：
 kCAMediaTimingFunctionLinear        线性,即匀速
 kCAMediaTimingFunctionEaseIn        先慢后快
 kCAMediaTimingFunctionEaseOut       先快后慢
 kCAMediaTimingFunctionEaseInEaseOut 先慢后快再慢
 kCAMediaTimingFunctionDefault       实际效果是动画中间比较快
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated type:(CATransitionType)type subType:(CATransitionSubtype)subtype function:(CAValueFunctionName)function;

@end
