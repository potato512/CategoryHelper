//
//  UIView+SYAnimation.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2020/4/8.
//  Copyright © 2020 BYD Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SYAnimation)

/// 旋转动画
- (void)animationRotationWithDuration:(NSTimeInterval)duration animation:(BOOL)isAnimation;

@end

NS_ASSUME_NONNULL_END
