//
//  UIImageView+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SYCategory)

#pragma mark - 链式属性

- (UIImageView *(^)(UIImage *image))image;

- (UIImageView *(^)(UIImage *image))highlightedImage;

- (UIImageView *(^)(NSArray<UIImage *> *images))animationImages;

- (UIImageView *(^)(NSArray<UIImage *> *images))highlightedAnimationImages;

- (UIImageView *(^)(NSTimeInterval duration))animationDuration;

- (UIImageView *(^)(NSInteger repeat))animationRepeatCount;

- (UIImageView *(^)(UIColor *color))tintColor;

@end
