//
//  UIProgressView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2018/9/18.
//  Copyright © 2018年 zhangshaoyu. All rights reserved.
//

#import "UIProgressView+SYCategory.h"

@implementation UIProgressView (SYCategory)

- (void)setHeightReal:(CGFloat)heightReal
{
    self.transform = CGAffineTransformMakeScale(1.0f, heightReal);
}

- (CGFloat)heightReal
{
    return self.transform.ty;
}

@end
