//
//  UISlider+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/2.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UISlider+SYCategory.h"
#import <objc/runtime.h>

static NSString *const keySliderClick = @"sliderClick";

@implementation UISlider (SYCategory)

#pragma mark - 回调方法

- (void)setSliderClick:(SliderClick)sliderClick
{
    if (sliderClick)
    {
        [self addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, &keySliderClick, sliderClick, OBJC_ASSOCIATION_COPY);
    }
}

- (SliderClick)sliderClick
{
    SliderClick sliderClick = objc_getAssociatedObject(self, &keySliderClick);
    return sliderClick;
}

- (void)actionClick:(UISlider *)slider
{
    if (self.sliderClick)
    {
        self.sliderClick(slider);
    }
}

+ (instancetype)sliderWithFrame:(CGRect)frame view:(UIView *)superview value:(float)value action:(SliderClick)sliderClick
{
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    if (superview && [superview isKindOfClass:[UIView class]])
    {
        [superview addSubview:slider];
    }
    slider.value = value;
    if (sliderClick)
    {
        slider.sliderClick = [sliderClick copy];
    }
    
    return slider;
}

@end