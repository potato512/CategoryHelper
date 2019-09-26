//
//  UINavigationController+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UINavigationController+SYCategory.h"
#import "UIImage+SYCategory.h"
#import "UIColor+SYCategory.h"

// 高度设置 20 44 64
//static CGFloat const heightStatusbar = 20.0;
//static CGFloat const heightNavigationbar = 44.0;
//static CGFloat const heightStatusAndNavbar = 64.0;
#define widthScreen  [UIScreen mainScreen].applicationFrame.size.width
#define heightScreen [UIScreen mainScreen].applicationFrame.size.height

@implementation UINavigationController (SYCategory)

#pragma mark 导航栏样式

/// 导航栏样式设置
- (void)navigationStyleDefault
{
    [self navigationStyleColor:[UIColor whiteColor] textFont:[UIFont boldSystemFontOfSize:18.0] textColor:[UIColor blackColor]];
}

/// 导航栏样式设置（自定义背景颜色、字体）
- (void)navigationStyleColor:(UIColor *)backgroundColor textFont:(UIFont *)textFont textColor:(UIColor *)textColor
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        // 背景色
        [self.navigationBar setBarTintColor:backgroundColor];
        self.navigationBar.translucent = NO;
        // 返回按钮标题颜色
        self.navigationBar.tintColor = textColor;
        
        // 字体
        self.navigationBar.titleTextAttributes = @{NSFontAttributeName:textFont, NSForegroundColorAttributeName:textColor};
        
        // 导航底部1px的阴影颜色-修改
        [self.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor colorWithHexadecimalString:@"0xd6d7dc"] size:CGSizeMake(1.0, 1.0)]];
        
        // 导航底部1px的阴影-遮住
        /*
         CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
         maskLayer.backgroundColor = kColorSeparatorline.CGColor;
         CGRect maskRect = CGRectMake(0, -heightStatusbar, widthScreen, heightStatusAndNavbar);
         maskLayer.path = CGPathCreateWithRect(maskRect, NULL);
         self.navigationBar.layer.mask = maskLayer;
         */
    }
}

- (void)animationAddWhilePushWithDuration:(NSTimeInterval)duration type:(CATransitionType)type subType:(CATransitionSubtype)subtype function:(CAValueFunctionName)function
{
    // 转场动画
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:function];
    animation.type = type;
    animation.subtype = subtype;
    // 添加转场动画到导航视图控制上
    [self.view.layer addAnimation:animation forKey:nil];
}

- (void)animationRemoveWhilePush
{
    [self.view.layer removeAllAnimations];
}


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
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated type:(CATransitionType)type subType:(CATransitionSubtype)subtype function:(CAValueFunctionName)function
{
    if (animated) {
        if (subtype == nil) {
            subtype = kCATransitionFromLeft;
        }
        if (function == nil) {
            function = kCAMediaTimingFunctionDefault;
        }
        [self animationAddWhilePushWithDuration:0.6 type:type subType:subtype function:function];
    }
    [self pushViewController:viewController animated:animated];
//    if (animated) {
//        [self animationRemoveWhilePush];
//    }
}

@end
