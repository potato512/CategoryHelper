//
//  UIView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/6/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIView+SYCategory.h"

@implementation UIView (SYCategory)

/**
 *  行玻璃效果（即实时模糊效果）
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+ (UIVisualEffectView *)effectViewWithFrame:(CGRect)frame
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}

@end
