//
//  UIImageView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/29.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UIImageView+SYCategory.h"

@implementation UIImageView (SYCategory)

#pragma mark - 链式属性

- (UIImageView *(^)(UIImage *image))image
{
    return ^(UIImage *image) {
        self.image = image;
        return self;
    };
}

- (UIImageView *(^)(UIImage *image))highlightedImage
{
    return ^(UIImage *image) {
        self.highlightedImage = image;
        return self;
    };
}

- (UIImageView *(^)(NSArray<UIImage *> *images))animationImages
{
    return ^(NSArray<UIImage *> *images) {
        self.animationImages = images;
        return self;
    };
}

- (UIImageView *(^)(NSArray<UIImage *> *images))highlightedAnimationImages
{
    return ^(NSArray<UIImage *> *images) {
        self.highlightedAnimationImages = images;
        return self;
    };
}


- (UIImageView *(^)(NSTimeInterval duration))animationDuration
{
    return ^(NSTimeInterval duration) {
        self.animationDuration = duration;
        return self;
    };
}

- (UIImageView *(^)(NSInteger repeat))animationRepeatCount
{
    return ^(NSInteger repeat) {
        self.animationRepeatCount = repeat;
        return self;
    };
}

- (UIImageView *(^)(UIColor *color))tintColor
{
    return ^(UIColor *color) {
        self.tintColor = color;
        return self;
    };
}

@end
