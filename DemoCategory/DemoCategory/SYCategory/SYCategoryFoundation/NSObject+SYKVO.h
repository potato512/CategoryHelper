//
//  NSObject+SYKVO.h
//  zhangshaoyu
//
//  Created by herman on 2017/4/20.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SYKVO)

/// 监听响应，同时进行回调响应
//- (void)observerComplete:(void (^)(id object))handle;

- (void)observerForKeyPath:(NSString *)keyPath complete:(void (^)(id object, NSDictionary *change))complete;

@end
