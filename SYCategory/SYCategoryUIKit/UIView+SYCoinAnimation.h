//
//  UIView+SYCoinAnimation.h
//  DemoCategory
//
//  Created by zhangshaoyu on 2019/9/26.
//  Copyright © 2019 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (SYCoinAnimation)

/// 第一个视图
@property (nonatomic, strong) UIView *primaryView;
/// 第二个视图
@property (nonatomic, strong) UIView *secondaryView;
/// 时间（默认1.0s）
@property (nonatomic, assign) NSTimeInterval durationTime;

/// 硬币翻转效果实例化视图
- (void)reloadCornView:(CGRect)frame view:(UIView *)superview duration:(NSTimeInterval)durationTime primaryView:(UIView *)primaryView secondaryView:(UIView *)secondaryView;
/// 刷新
- (void)reloadCornView;

@end

NS_ASSUME_NONNULL_END
