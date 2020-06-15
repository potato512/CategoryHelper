//
//  UIView+SYAnimation.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2020/4/8.
//  Copyright © 2020 BYD Inc. All rights reserved.
//

#import "UIView+SYAnimation.h"


@implementation UIView (SYAnimation)

/// 旋转动画
- (void)animationRotationWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation
{
    [self.layer removeAllAnimations];
    
    if (isAnimation) {
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        rotationAnimation.duration = duration;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = MAXFLOAT;
        [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    } else {
        
    }
}

@end
