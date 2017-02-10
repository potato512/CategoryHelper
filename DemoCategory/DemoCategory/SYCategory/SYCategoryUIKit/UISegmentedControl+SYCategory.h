//
//  UISegmentedControl+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/1/16.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SegmentClick)(UISegmentedControl *sender);

@interface UISegmentedControl (SYCategory)

/// 回调方法
@property (nonatomic, copy) SegmentClick segmentClick;

@end
