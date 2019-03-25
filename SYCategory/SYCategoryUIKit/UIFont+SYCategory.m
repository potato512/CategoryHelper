//
//  UIFont+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/25.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
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

UIFont *UIFontNameSize(NSString *name, CGFloat size)
{
    return [UIFont fontWithName:name size:size];
}

@end
