//
//  NSURL+SYCategory.m
//  zhangshaoyu
//
//  Created by zhangshaoyu on 2019/3/12.
//  Copyright © 2019年 zhangshaoyu. All rights reserved.
//

#import "NSURL+SYCategory.h"
#import "NSString+SYRegular.h"

@implementation NSURL (SYCategory)

NSURL *NSURLFromString(NSString *string)
{
    NSURL *url = [NSURL fileURLWithPath:string];
    if (string.isNetString) {
        url = [NSURL URLWithString:string];
    }
    return url;
}

@end
