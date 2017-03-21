//
//  UIBarButtonItem+SYCategory.m
//  DemoCategory
//
//  Created by zhangshaoyu on 17/3/21.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "UIBarButtonItem+SYCategory.h"

typedef void(^ BarButtonItemAction)(UIButton *item);
static BarButtonItemAction barButtonItemAction;

@implementation UIBarButtonItem (SYCategory)

+ (UIBarButtonItem *)buttonItemWithTitle:(NSString *)title action:(void (^)(UIButton *item))action
{
    if (action)
    {
        barButtonItemAction = [action copy];
    }
    
    UIBarButtonItem *item = [UIBarButtonItem buttonItemWithTitle:title titleHlight:nil titleColor:nil titleColorHlight:nil image:nil imageHlight:nil backImage:nil backImageHlight:nil action:action];
    return item;
}

+ (UIBarButtonItem *)buttonItemWithImage:(UIImage *)image action:(void (^)(UIButton *item))action
{
    if (action)
    {
        barButtonItemAction = [action copy];
    }
    
    UIBarButtonItem *item = [UIBarButtonItem buttonItemWithTitle:nil titleHlight:nil titleColor:nil titleColorHlight:nil image:image imageHlight:nil backImage:nil backImageHlight:nil action:action];
    return item;
}

+ (UIBarButtonItem *)buttonItemWithTitle:(NSString *)title titleHlight:(NSString *)titleH titleColor:(UIColor *)color titleColorHlight:(UIColor *)colorH image:(UIImage *)image imageHlight:(UIImage *)imageH backImage:(UIImage *)backImage backImageHlight:(UIImage *)backImageH action:(void (^)(id item))action
{
    if (action)
    {
        barButtonItemAction = [action copy];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 标题
    [button setTitle:(title ? title : @"None") forState:UIControlStateNormal];
    if (titleH)
    {
        [button setTitle:titleH forState:UIControlStateHighlighted];
    }
    // 标题颜色
    [button setTitleColor:(color ? color : [UIColor blackColor]) forState:UIControlStateNormal];
    if (colorH)
    {
        [button setTitleColor:colorH forState:UIControlStateHighlighted];
    }
    // 图标
    if (image)
    {
        [button setImage:image forState:UIControlStateNormal];
    }
    if (imageH)
    {
        [button setImage:imageH forState:UIControlStateHighlighted];
    }
    // 背景图片
    if (backImage)
    {
        [button setBackgroundImage:backImage forState:UIControlStateNormal];
    }
    if (backImageH)
    {
        [button setBackgroundImage:backImageH forState:UIControlStateHighlighted];
    }
    
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0.0, 0.0, 80.0, 40.0);
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    return item;
}

+ (void)buttonAction:(id)item
{
    if (barButtonItemAction)
    {
        barButtonItemAction(item);
    }
}

@end
