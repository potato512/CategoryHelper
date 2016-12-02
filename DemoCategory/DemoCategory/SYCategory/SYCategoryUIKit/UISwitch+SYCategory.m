//
//  UISwitch+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/12/2.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import "UISwitch+SYCategory.h"
#import <objc/runtime.h>

static NSString *const keySwitchClick = @"switchClick";

@implementation UISwitch (SYCategory)

#pragma mark - 回调方法

- (void)setSwitchClick:(SwitchClick)switchClick
{
    if (switchClick)
    {
        [self addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventValueChanged];
        objc_setAssociatedObject(self, &keySwitchClick, switchClick, OBJC_ASSOCIATION_COPY);
    }
}

- (SwitchClick)switchClick
{
    SwitchClick switchClick = objc_getAssociatedObject(self, &keySwitchClick);
    return switchClick;
}

- (void)actionClick:(UISwitch *)sender
{
    if (self.switchClick)
    {
        self.switchClick(sender);
    }
}

@end
