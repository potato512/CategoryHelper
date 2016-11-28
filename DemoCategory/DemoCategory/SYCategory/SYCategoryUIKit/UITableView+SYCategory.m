//
//  UITableView+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/28.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UITableView+SYCategory.h"

@implementation UITableView (SYCategory)

/// 设置列表视图cell分割线缩进样式
- (void)tableViewCellSeparatorInset:(UIEdgeInsets)edge
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        self.separatorInset = edge;
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        self.layoutMargins = edge;
    }
}

@end
