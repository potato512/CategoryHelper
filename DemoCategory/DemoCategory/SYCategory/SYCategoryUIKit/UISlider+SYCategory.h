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

@end
