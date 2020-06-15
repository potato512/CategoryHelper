//
//  UIFont+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2020/4/28.
//  Copyright © 2020 zhangshaoyu. All rights reserved.
//

#import "UIFont+SYCategory.h"

@implementation UIFont (SYCategory)

UIFont *UIFontSize(CGFloat size)
{
    return [UIFont systemFontOfSize:size];
}

UIFont *UIFontBoldSize(CGFloat size)
{
    return [UIFont boldSystemFontOfSize:size];
}

@end
