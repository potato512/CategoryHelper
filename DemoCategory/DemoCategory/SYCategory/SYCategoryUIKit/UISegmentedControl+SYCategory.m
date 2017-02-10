//
//  UISegmentedControl+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/1/16.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import "UISegmentedControl+SYCategory.h"
#import <objc/runtime.h>

static NSString *const keySegmentClick = @"SegmentClick";

@implementation UISegmentedControl (SYCategory)

#pragma mark - 回调方法

- (void)setSegmentClick:(SegmentClick)segmentClick
{
    if (segmentClick)
    {
        [self addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, &keySegmentClick, segmentClick, OBJC_ASSOCIATION_COPY);
    }
}

- (SegmentClick)segmentClick
{
    SegmentClick segmentClick = objc_getAssociatedObject(self, &keySegmentClick);
    return segmentClick;
}

- (void)actionClick:(UISegmentedControl *)sender
{
    if (self.segmentClick)
    {
        self.segmentClick(sender);
    }
}

@end
