//
//  UISlider+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/2.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SliderClick)(UISlider *slider);

@interface UISlider (SYCategory)

/// 回调方法
@property (nonatomic, copy) SliderClick sliderClick;

/**
 *  实例化UISlider
 *
 *  @param frame       坐标大小
 *  @param superview   父视图
 *  @param value       当前进度值（默认最小值：0.0；默认最大值：1.0）
 *  @param sliderClick 响应事件
 *
 *  @return UISlider
 */
+ (instancetype)sliderWithFrame:(CGRect)frame view:(UIView *)superview value:(float)value action:(SliderClick)sliderClick;


#pragma mark - 链式属性

- (UISlider *(^)(float value))value;

- (UISlider *(^)(float value))minimumValue;

- (UISlider *(^)(float value))maximumValue;

- (UISlider *(^)(UIImage *image))minimumValueImage;

- (UISlider *(^)(UIImage *image))maximumValueImage;

- (UISlider *(^)(UIColor *color))thumbTintColor;

- (UISlider *(^)(UIColor *color))minimumTrackTintColor;

- (UISlider *(^)(UIColor *color))maximumTrackTintColor;




@end
