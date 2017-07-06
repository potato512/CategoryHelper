//
//  UISlider+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/2.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UISlider+SYCategory.h"
#import <objc/runtime.h>

@implementation UISlider (SYCategory)

#pragma mark - 回调方法

- (void)setSliderClick:(SliderClick)sliderClick
{
    if (sliderClick)
    {
        [self addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, @selector(sliderClick), sliderClick, OBJC_ASSOCIATION_COPY);
    }
}

- (SliderClick)sliderClick
{
    SliderClick sliderClick = objc_getAssociatedObject(self, @selector(sliderClick));
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


#pragma mark - 链式属性

- (UISlider *(^)(float value))value
{
    return ^(float value) {
        self.value = value;
        return self;
    };
}

- (UISlider *(^)(float value))minimumValue
{
    return ^(float value) {
        self.minimumValue = value;
        return self;
    };
}

- (UISlider *(^)(float value))maximumValue
{
    return ^(float value) {
        self.maximumValue = value;
        return self;
    };
}

- (UISlider *(^)(UIImage *image))minimumValueImage
{
    return ^(UIImage *image) {
        self.minimumValueImage = image;
        return self;
    };
}

- (UISlider *(^)(UIImage *image))maximumValueImage
{
    return ^(UIImage *image) {
        self.maximumValueImage = image;
        return self;
    };
}

- (UISlider *(^)(UIColor *color))thumbTintColor
{
    return ^(UIColor *color) {
        self.thumbTintColor = color;
        return self;
    };
}

- (UISlider *(^)(UIColor *color))minimumTrackTintColor
{
    return ^(UIColor *color) {
        self.minimumTrackTintColor = color;
        return self;
    };
}

- (UISlider *(^)(UIColor *color))maximumTrackTintColor
{
    return ^(UIColor *color) {
        self.maximumTrackTintColor = color;
        return self;
    };
}

@end
