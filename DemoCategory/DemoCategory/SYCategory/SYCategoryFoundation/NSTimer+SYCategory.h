//
//  NSTimer+SYCategory.h
//  zhangshaoyu
//
//  Created by zhangshaoyu on 16/11/25.
//  Copyright © 2016年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SYCategory)

/// 开启定时器
- (void)timerStart;

/// 关闭定时器
- (void)timerStop;

/// 永久停止定时器
- (void)timerKill;

@end
